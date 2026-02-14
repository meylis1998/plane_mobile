import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/models/view_mode.dart';
import 'package:feature_work_items/src/providers/project_labels_provider.dart';
import 'package:feature_work_items/src/providers/project_members_provider.dart';
import 'package:feature_work_items/src/providers/project_states_provider.dart';
import 'package:feature_work_items/src/providers/view_mode_provider.dart';
import 'package:feature_work_items/src/providers/work_item_filter_provider.dart';
import 'package:feature_work_items/src/providers/work_item_kanban_provider.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:feature_work_items/src/providers/work_item_sort_provider.dart';
import 'package:feature_work_items/src/widgets/filter_sheet.dart';
import 'package:feature_work_items/src/widgets/sort_sheet.dart';
import 'package:feature_work_items/src/widgets/work_item_calendar_view.dart';
import 'package:feature_work_items/src/widgets/work_item_filter_bar.dart';
import 'package:feature_work_items/src/widgets/work_item_kanban_view.dart';
import 'package:feature_work_items/src/widgets/work_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

class WorkItemListScreen extends ConsumerWidget {
  const WorkItemListScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.projectIdentifier,
    this.onItemTap,
    this.onCreateTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final String? projectIdentifier;
  final void Function(WorkItem)? onItemTap;
  final VoidCallback? onCreateTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewMode = ref.watch(viewModeNotifierProvider);
    final filter = ref.watch(workItemFilterNotifierProvider);
    final sort = ref.watch(workItemSortNotifierProvider);
    final itemsAsync = ref.watch(
      workItemListProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Items'),
        actions: [
          IconButton(
            icon: Icon(
              switch (viewMode) {
                ViewMode.list => Icons.view_kanban_rounded,
                ViewMode.kanban => Icons.calendar_month_rounded,
                ViewMode.calendar => Icons.list_rounded,
              },
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              ref.read(viewModeNotifierProvider.notifier).toggle();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          WorkItemFilterBar(
            filter: filter,
            sort: sort,
            onFilterTap: () => _showFilterSheet(context, ref),
            onSortTap: () => _showSortSheet(context, ref),
            onClearFilters: () {
              ref.read(workItemFilterNotifierProvider.notifier).clear();
            },
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: KeyedSubtree(
                key: ValueKey(viewMode),
                child: switch (viewMode) {
                  ViewMode.list => _buildListView(ref, itemsAsync),
                  ViewMode.kanban => _buildKanbanView(ref),
                  ViewMode.calendar => WorkItemCalendarView(
                      workspaceSlug: workspaceSlug,
                      projectId: projectId,
                      projectIdentifier: projectIdentifier,
                      onItemTap: onItemTap,
                    ),
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTap,
        backgroundColor: PlaneColors.primary,
        child: const Icon(Icons.add, color: PlaneColors.white),
      ),
    );
  }

  Widget _buildListView(
    WidgetRef ref,
    AsyncValue<List<WorkItem>> itemsAsync,
  ) {
    return itemsAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return const PlaneEmptyState(
            icon: Icons.inbox_rounded,
            title: 'No work items yet',
            message: 'Create your first work item to start tracking tasks.',
          );
        }
        return WorkItemListView(
          items: items,
          projectIdentifier: projectIdentifier,
          onItemTap: onItemTap,
          onRefresh: () async {
            await ref.read(
              workItemListProvider(
                workspaceSlug: workspaceSlug,
                projectId: projectId,
              ).notifier,
            ).refresh();
          },
        );
      },
      loading: PlaneLoadingShimmer.list,
      error: (error, stack) => PlaneErrorWidget(
        message: 'Failed to load work items',
        detail: error.toString(),
        onRetry: () {
          ref.invalidate(
            workItemListProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
            ),
          );
        },
      ),
    );
  }

  Widget _buildKanbanView(WidgetRef ref) {
    final kanbanAsync = ref.watch(
      workItemKanbanProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    final statesAsync = ref.watch(
      projectStatesNotifierProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );

    return kanbanAsync.when(
      data: (grouped) {
        final states = statesAsync.valueOrNull ?? [];
        return WorkItemKanbanView(
          groupedItems: grouped,
          states: states,
          projectIdentifier: projectIdentifier,
          onItemTap: onItemTap,
          onMoveItem: (item, toStateId, index) {
            HapticFeedback.lightImpact();
            ref
                .read(
                  workItemKanbanProvider(
                    workspaceSlug: workspaceSlug,
                    projectId: projectId,
                  ).notifier,
                )
                .moveItem(
                  itemId: item.id,
                  fromStateId: item.state.id,
                  toStateId: toStateId,
                  newIndex: index,
                );
          },
        );
      },
      loading: PlaneLoadingShimmer.kanban,
      error: (error, stack) => PlaneErrorWidget(
        message: 'Failed to load kanban board',
        detail: error.toString(),
        onRetry: () {
          ref.invalidate(
            workItemKanbanProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
            ),
          );
        },
      ),
    );
  }

  void _showFilterSheet(BuildContext context, WidgetRef ref) {
    final filter = ref.read(workItemFilterNotifierProvider);
    final members = ref
            .read(
              projectMembersNotifierProvider(
                workspaceSlug: workspaceSlug,
                projectId: projectId,
              ),
            )
            .valueOrNull ??
        [];
    final labels = ref
            .read(
              projectLabelsNotifierProvider(
                workspaceSlug: workspaceSlug,
                projectId: projectId,
              ),
            )
            .valueOrNull ??
        [];

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => FilterSheet(
        selectedStateGroups: filter.stateGroups,
        selectedPriorities: filter.priorities,
        selectedAssigneeIds: filter.assigneeIds,
        selectedLabelIds: filter.labelIds,
        members: members,
        labels: labels,
        onApply: ({
          required stateGroups,
          required priorities,
          required assigneeIds,
          required labelIds,
        }) {
          ref.read(workItemFilterNotifierProvider.notifier)
            ..setStateGroups(stateGroups)
            ..setPriorities(priorities)
            ..setAssigneeIds(assigneeIds)
            ..setLabelIds(labelIds);
        },
      ),
    );
  }

  void _showSortSheet(BuildContext context, WidgetRef ref) {
    final sort = ref.read(workItemSortNotifierProvider);
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => SortSheet(
        currentSort: sort,
        onApply: (newSort) {
          ref.read(workItemSortNotifierProvider.notifier)
            ..setField(newSort.field)
            ..setDirection(newSort.direction);
        },
      ),
    );
  }
}
