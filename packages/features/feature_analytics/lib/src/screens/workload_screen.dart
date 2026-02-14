import 'package:feature_analytics/src/models/workload_item.dart';
import 'package:feature_analytics/src/providers/workload_provider.dart';
import 'package:feature_analytics/src/widgets/workload_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Screen showing workload distribution across team members:
/// a grouped bar chart (assigned vs completed) and a list view
/// with member details. Supports sorting by most/least assigned.
class WorkloadScreen extends ConsumerStatefulWidget {
  const WorkloadScreen({
    required this.workspaceSlug,
    required this.projectId,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;

  @override
  ConsumerState<WorkloadScreen> createState() => _WorkloadScreenState();
}

class _WorkloadScreenState extends ConsumerState<WorkloadScreen> {
  WorkloadSortOrder _sortOrder = WorkloadSortOrder.mostAssigned;

  @override
  Widget build(BuildContext context) {
    final workloadAsync = ref.watch(
      workloadProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
        sort: _sortOrder,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Workload'),
        actions: [
          PopupMenuButton<WorkloadSortOrder>(
            icon: const Icon(Icons.sort),
            onSelected: (order) {
              setState(() => _sortOrder = order);
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: WorkloadSortOrder.mostAssigned,
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 18,
                      color: _sortOrder == WorkloadSortOrder.mostAssigned
                          ? PlaneColors.primary
                          : Colors.transparent,
                    ),
                    const SizedBox(width: 8),
                    const Text('Most Assigned'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: WorkloadSortOrder.leastAssigned,
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 18,
                      color: _sortOrder == WorkloadSortOrder.leastAssigned
                          ? PlaneColors.primary
                          : Colors.transparent,
                    ),
                    const SizedBox(width: 8),
                    const Text('Least Assigned'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: workloadAsync.when(
        loading: PlaneLoadingShimmer.chart,
        error: (error, _) => Center(
          child: PlaneErrorWidget(
            message: 'Failed to load workload data',
            onRetry: () => ref.invalidate(
              workloadProvider(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
                sort: _sortOrder,
              ),
            ),
          ),
        ),
        data: (items) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(
              workloadProvider(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
                sort: _sortOrder,
              ),
            );
            await ref.read(
              workloadProvider(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
                sort: _sortOrder,
              ).future,
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(PlaneSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Workload Distribution',
                  style: PlaneTypography.titleSmall.copyWith(
                    color: PlaneColors.grey800,
                  ),
                ),
                const SizedBox(height: PlaneSpacing.sm),
                WorkloadBarChart(items: items),
                const SizedBox(height: PlaneSpacing.lg),
                Text(
                  'Team Members',
                  style: PlaneTypography.titleSmall.copyWith(
                    color: PlaneColors.grey800,
                  ),
                ),
                const SizedBox(height: PlaneSpacing.sm),
                _MemberList(items: items),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MemberList extends StatelessWidget {
  const _MemberList({required this.items});

  final List<WorkloadItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        color: PlaneColors.grey200,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        final completionPct = item.assignedCount > 0
            ? (item.completedCount / item.assignedCount * 100).round()
            : 0;
        return _MemberTile(item: item, completionPct: completionPct);
      },
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({
    required this.item,
    required this.completionPct,
  });

  final WorkloadItem item;
  final int completionPct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PlaneSpacing.sm),
      child: Row(
        children: [
          PlaneAvatar(
            name: item.memberName,
            imageUrl: item.avatar,
            size: 36,
          ),
          const SizedBox(width: PlaneSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.memberName,
                  style: PlaneTypography.titleSmall.copyWith(
                    color: PlaneColors.grey800,
                  ),
                ),
                const SizedBox(height: 2),
                // Mini progress bar
                ClipRRect(
                  borderRadius: PlaneRadius.full,
                  child: LinearProgressIndicator(
                    value: item.assignedCount > 0
                        ? item.completedCount / item.assignedCount
                        : 0,
                    backgroundColor: PlaneColors.grey200,
                    color: PlaneColors.success,
                    minHeight: 4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: PlaneSpacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${item.completedCount}/${item.assignedCount}',
                style: PlaneTypography.labelMedium.copyWith(
                  color: PlaneColors.grey700,
                ),
              ),
              Text(
                '$completionPct%',
                style: PlaneTypography.labelSmall.copyWith(
                  color: PlaneColors.grey400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
