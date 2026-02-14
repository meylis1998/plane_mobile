import 'dart:io';

import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/project_members_provider.dart';
import 'package:feature_work_items/src/providers/project_states_provider.dart';
import 'package:feature_work_items/src/providers/sub_issues_provider.dart';
import 'package:feature_work_items/src/providers/work_item_activity_provider.dart';
import 'package:feature_work_items/src/providers/work_item_comments_provider.dart';
import 'package:feature_work_items/src/providers/work_item_detail_provider.dart';
import 'package:feature_work_items/src/providers/work_item_mutations_provider.dart';
import 'package:feature_work_items/src/widgets/activity_feed.dart';
import 'package:feature_work_items/src/widgets/comment_input.dart';
import 'package:feature_work_items/src/widgets/comment_list.dart';
import 'package:feature_work_items/src/widgets/date_picker_field.dart';
import 'package:feature_work_items/src/widgets/priority_icon.dart';
import 'package:feature_work_items/src/widgets/priority_selector.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:feature_work_items/src/widgets/state_selector.dart';
import 'package:feature_work_items/src/widgets/sub_issues_list.dart';
import 'package:file_service/file_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

class WorkItemDetailScreen extends ConsumerWidget {
  const WorkItemDetailScreen({
    required this.workspaceSlug,
    required this.projectId,
    required this.workItemId,
    this.projectIdentifier,
    this.onEdit,
    this.onSubItemTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final String workItemId;
  final String? projectIdentifier;
  final void Function(WorkItem)? onEdit;
  final void Function(WorkItem)? onSubItemTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(
      workItemDetailProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        workItemId: workItemId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          projectIdentifier != null
              ? '$projectIdentifier Issue'
              : 'Work Item',
        ),
        actions: [
          if (detailAsync.valueOrNull != null)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => onEdit?.call(detailAsync.valueOrNull!),
            ),
        ],
      ),
      body: detailAsync.when(
        data: (item) => _WorkItemDetailBody(
          workItem: item,
          workspaceSlug: workspaceSlug,
          projectId: projectId,
          projectIdentifier: projectIdentifier,
          onSubItemTap: onSubItemTap,
        ),
        loading: PlaneLoadingShimmer.detail,
        error: (error, stack) => PlaneErrorWidget(
          message: 'Failed to load work item',
          detail: error.toString(),
          onRetry: () => ref.invalidate(
            workItemDetailProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
              workItemId: workItemId,
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkItemDetailBody extends ConsumerStatefulWidget {
  const _WorkItemDetailBody({
    required this.workItem,
    required this.workspaceSlug,
    required this.projectId,
    this.projectIdentifier,
    this.onSubItemTap,
  });

  final WorkItem workItem;
  final String workspaceSlug;
  final String projectId;
  final String? projectIdentifier;
  final void Function(WorkItem)? onSubItemTap;

  @override
  ConsumerState<_WorkItemDetailBody> createState() =>
      _WorkItemDetailBodyState();
}

class _WorkItemDetailBodyState extends ConsumerState<_WorkItemDetailBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final item = widget.workItem;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                if (widget.projectIdentifier != null &&
                    item.sequenceId != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '${widget.projectIdentifier}-${item.sequenceId}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: PlaneColors.textSecondaryLight,
                      ),
                    ),
                  ),
                Text(
                  item.name,
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),

                // Properties
                _buildPropertyRow(
                  context,
                  label: 'State',
                  child: InkWell(
                    onTap: () => _showStateSelector(context),
                    borderRadius: BorderRadius.circular(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StateDot(state: item.state),
                        const SizedBox(width: 6),
                        Text(item.state.name),
                      ],
                    ),
                  ),
                ),
                _buildPropertyRow(
                  context,
                  label: 'Priority',
                  child: InkWell(
                    onTap: () => _showPrioritySelector(context),
                    borderRadius: BorderRadius.circular(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PriorityIcon(priority: item.priority),
                        const SizedBox(width: 6),
                        Text(PriorityIcon.label(item.priority)),
                      ],
                    ),
                  ),
                ),
                if (item.startDate != null || item.targetDate != null) ...[
                  _buildPropertyRow(
                    context,
                    label: 'Start Date',
                    child: Text(
                      item.startDate != null
                          ? DatePickerField.formatDate(item.startDate!)
                          : 'Not set',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: item.startDate != null
                            ? null
                            : PlaneColors.textTertiaryLight,
                      ),
                    ),
                  ),
                  _buildPropertyRow(
                    context,
                    label: 'Due Date',
                    child: Text(
                      item.targetDate != null
                          ? DatePickerField.formatDate(item.targetDate!)
                          : 'Not set',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: item.targetDate != null
                            ? null
                            : PlaneColors.textTertiaryLight,
                      ),
                    ),
                  ),
                ],

                // Description
                if (item.description != null &&
                    item.description!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  const Divider(color: PlaneColors.dividerLight),
                  const SizedBox(height: 8),
                  Text(
                    'Description',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description!,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],

                const SizedBox(height: 16),
                const Divider(color: PlaneColors.dividerLight),

                // Tabs for sub-issues, comments, activity
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Sub-Issues'),
                    Tab(text: 'Comments'),
                    Tab(text: 'Activity'),
                    Tab(text: 'Attachments'),
                  ],
                ),
                SizedBox(
                  height: 400,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildSubIssuesTab(),
                      _buildCommentsTab(),
                      _buildActivityTab(),
                      _buildAttachmentsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Comment input at bottom
        CommentInput(
          onSubmit: (body) {
            ref
                .read(
                  workItemCommentsProvider(
                    workspaceSlug: widget.workspaceSlug,
                    projectId: widget.projectId,
                    workItemId: widget.workItem.id,
                  ).notifier,
                )
                .addComment(
                  body: body,
                  createdById: '',
                );
          },
        ),
      ],
    );
  }

  Widget _buildPropertyRow(
    BuildContext context, {
    required String label,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: PlaneColors.textSecondaryLight,
                  ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget _buildSubIssuesTab() {
    final subIssuesAsync = ref.watch(
      subIssuesProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
        parentId: widget.workItem.id,
      ),
    );
    return subIssuesAsync.when(
      data: (subIssues) => SubIssuesList(
        subIssues: subIssues,
        projectIdentifier: widget.projectIdentifier,
        onItemTap: widget.onSubItemTap,
      ),
      loading: PlaneLoadingShimmer.list,
      error: (error, _) => PlaneErrorWidget(
        message: 'Failed to load',
        detail: error.toString(),
      ),
    );
  }

  Widget _buildCommentsTab() {
    final commentsAsync = ref.watch(
      workItemCommentsProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
        workItemId: widget.workItem.id,
      ),
    );
    final members = ref
            .watch(
              projectMembersNotifierProvider(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
              ),
            )
            .valueOrNull ??
        [];
    return commentsAsync.when(
      data: (comments) => CommentList(comments: comments, members: members),
      loading: PlaneLoadingShimmer.list,
      error: (error, _) => PlaneErrorWidget(
        message: 'Failed to load',
        detail: error.toString(),
      ),
    );
  }

  Widget _buildActivityTab() {
    final activityAsync = ref.watch(
      workItemActivityProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
        workItemId: widget.workItem.id,
      ),
    );
    return activityAsync.when(
      data: (activities) => ActivityFeed(activities: activities),
      loading: PlaneLoadingShimmer.list,
      error: (error, _) => PlaneErrorWidget(
        message: 'Failed to load',
        detail: error.toString(),
      ),
    );
  }

  Widget _buildAttachmentsTab() {
    final attachmentsAsync = ref.watch(
      workItemAttachmentsProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
        workItemId: widget.workItem.id,
      ),
    );
    final uploadProgress = ref.watch(uploadAttachmentProvider);

    return attachmentsAsync.when(
      data: (attachments) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: AddAttachmentButton(
              onFilePicked: (File file) {
                ref.read(uploadAttachmentProvider.notifier).upload(
                      workspaceSlug: widget.workspaceSlug,
                      projectId: widget.projectId,
                      workItemId: widget.workItem.id,
                      file: file,
                    );
              },
            ),
          ),
          if (uploadProgress != null && !uploadProgress.isComplete)
            UploadProgressIndicator(progress: uploadProgress),
          Expanded(
            child: AttachmentList(attachments: attachments),
          ),
        ],
      ),
      loading: PlaneLoadingShimmer.list,
      error: (error, _) => PlaneErrorWidget(
        message: 'Failed to load',
        detail: error.toString(),
      ),
    );
  }

  void _showStateSelector(BuildContext context) {
    final statesAsync = ref.read(
      projectStatesNotifierProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
      ),
    );
    final states = statesAsync.valueOrNull ?? [];
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => StateSelector(
        states: states,
        selectedStateId: widget.workItem.state.id,
        onSelected: (newState) {
          HapticFeedback.lightImpact();
          ref.read(workItemMutationsProvider.notifier).updateState(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
                workItem: widget.workItem,
                newState: newState,
              );
        },
      ),
    );
  }

  void _showPrioritySelector(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => PrioritySelector(
        selectedPriority: widget.workItem.priority,
        onSelected: (newPriority) {
          HapticFeedback.lightImpact();
          ref.read(workItemMutationsProvider.notifier).updatePriority(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
                workItem: widget.workItem,
                newPriority: newPriority,
              );
        },
      ),
    );
  }
}
