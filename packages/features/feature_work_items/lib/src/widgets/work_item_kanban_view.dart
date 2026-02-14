import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/work_item_kanban_column.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class WorkItemKanbanView extends StatelessWidget {
  const WorkItemKanbanView({
    required this.groupedItems,
    required this.states,
    this.projectIdentifier,
    this.onItemTap,
    this.onMoveItem,
    this.isLoading = false,
    super.key,
  });

  final Map<String, List<WorkItem>> groupedItems;
  final List<WorkItemState> states;
  final String? projectIdentifier;
  final void Function(WorkItem)? onItemTap;
  final void Function(WorkItem item, String toStateId, int index)? onMoveItem;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return PlaneLoadingShimmer.kanban();
    }

    if (states.isEmpty) {
      return const PlaneEmptyState(
        icon: Icons.view_kanban_rounded,
        title: 'No states configured',
        message: 'Add workflow states in project settings to use the '
            'kanban board.',
      );
    }

    // Sort states by sequence
    final sortedStates = List<WorkItemState>.from(states)
      ..sort((a, b) => a.sequence.compareTo(b.sequence));

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(12),
      itemCount: sortedStates.length,
      itemBuilder: (context, index) {
        final state = sortedStates[index];
        final items = groupedItems[state.id] ?? [];
        return WorkItemKanbanColumn(
          state: state,
          items: items,
          projectIdentifier: projectIdentifier,
          onItemTap: onItemTap,
          onAcceptItem: (item, idx) {
            onMoveItem?.call(item, state.id, idx);
          },
        );
      },
    );
  }
}
