import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/providers/cycle_analytics_provider.dart';
import 'package:feature_cycles/src/providers/cycle_detail_provider.dart';
import 'package:feature_cycles/src/providers/cycle_issues_provider.dart';
import 'package:feature_cycles/src/providers/cycle_mutations_provider.dart';
import 'package:feature_cycles/src/widgets/burndown_chart.dart';
import 'package:feature_cycles/src/widgets/cycle_date_range.dart';
import 'package:feature_cycles/src/widgets/cycle_issue_list.dart';
import 'package:feature_cycles/src/widgets/cycle_progress_bar.dart';
import 'package:feature_cycles/src/widgets/cycle_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Detail screen for a single cycle.
/// Shows header (name, dates, status), progress with burndown chart,
/// issues list, and edit/delete actions.
class CycleDetailScreen extends ConsumerWidget {
  const CycleDetailScreen({
    required this.workspaceSlug,
    required this.projectId,
    required this.cycleId,
    this.onEdit,
    this.onIssueTap,
    this.onAddIssueTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final String cycleId;
  final void Function(Cycle)? onEdit;
  final void Function(WorkItem)? onIssueTap;
  final VoidCallback? onAddIssueTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(
      cycleDetailProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        cycleId: cycleId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cycle Details'),
        actions: [
          if (detailAsync.valueOrNull != null) ...[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => onEdit?.call(detailAsync.valueOrNull!),
            ),
            PopupMenuButton<String>(
              onSelected: (action) {
                if (action == 'delete') {
                  _confirmDelete(context, ref);
                }
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline, color: PlaneColors.error),
                      SizedBox(width: 8),
                      Text(
                        'Delete Cycle',
                        style: TextStyle(color: PlaneColors.error),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
      body: detailAsync.when(
        loading: PlaneLoadingShimmer.detail,
        error: (error, _) => Center(
          child: PlaneErrorWidget(
            message: 'Failed to load cycle',
            onRetry: () => ref.invalidate(
              cycleDetailProvider(
                workspaceSlug: workspaceSlug,
                projectId: projectId,
                cycleId: cycleId,
              ),
            ),
          ),
        ),
        data: (cycle) => _CycleDetailBody(
          cycle: cycle,
          workspaceSlug: workspaceSlug,
          projectId: projectId,
          onIssueTap: onIssueTap,
          onAddIssueTap: onAddIssueTap,
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Cycle'),
        content: const Text(
          'Are you sure you want to delete this cycle? '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await ref.read(cycleMutationsProvider.notifier).deleteCycle(
                    workspaceSlug: workspaceSlug,
                    projectId: projectId,
                    cycleId: cycleId,
                  );
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: PlaneColors.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _CycleDetailBody extends ConsumerWidget {
  const _CycleDetailBody({
    required this.cycle,
    required this.workspaceSlug,
    required this.projectId,
    this.onIssueTap,
    this.onAddIssueTap,
  });

  final Cycle cycle;
  final String workspaceSlug;
  final String projectId;
  final void Function(WorkItem)? onIssueTap;
  final VoidCallback? onAddIssueTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(
      cycleAnalyticsProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        cycleId: cycle.id,
      ),
    );

    final issuesAsync = ref.watch(
      cycleIssuesProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        cycleId: cycle.id,
      ),
    );

    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(PlaneSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cycle name and status
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: PlaneColors.primarySurface,
                  borderRadius: PlaneRadius.md,
                ),
                child: const Icon(
                  Icons.cyclone,
                  color: PlaneColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  cycle.name,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              if (cycle.status != null) CycleStatusBadge(status: cycle.status!),
            ],
          ),
          const SizedBox(height: PlaneSpacing.md),

          // Description
          if (cycle.description != null &&
              cycle.description!.isNotEmpty) ...[
            Text(
              cycle.description!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: PlaneColors.grey600,
              ),
            ),
            const SizedBox(height: PlaneSpacing.md),
          ],

          // Date range
          CycleDateRange(
            startDate: cycle.startDate,
            endDate: cycle.endDate,
          ),
          const SizedBox(height: PlaneSpacing.lg),

          // Progress section
          Text('Progress', style: theme.textTheme.titleSmall),
          const SizedBox(height: PlaneSpacing.sm),
          CycleProgressBar(
            completed: cycle.completedIssues ?? 0,
            total: cycle.totalIssues ?? 0,
          ),
          const SizedBox(height: PlaneSpacing.lg),

          // Burndown chart
          Text('Burndown Chart', style: theme.textTheme.titleSmall),
          const SizedBox(height: PlaneSpacing.sm),
          analyticsAsync.when(
            loading: () => SizedBox(
              height: 240,
              child: PlaneLoadingShimmer.chart(),
            ),
            error: (error, _) => SizedBox(
              height: 240,
              child: Center(
                child: Text(
                  'Unable to load chart data',
                  style: PlaneTypography.bodySmall.copyWith(
                    color: PlaneColors.grey400,
                  ),
                ),
              ),
            ),
            data: (dataPoints) => BurndownChart(
              dataPoints: dataPoints,
              totalIssues: cycle.totalIssues ?? 0,
              startDate: cycle.startDate ?? DateTime.now(),
              endDate: cycle.endDate ?? DateTime.now(),
            ),
          ),
          const SizedBox(height: PlaneSpacing.lg),

          // Issues section
          Row(
            children: [
              Text('Issues', style: theme.textTheme.titleSmall),
              const Spacer(),
              PlaneButton(
                label: 'Add Issue',
                variant: PlaneButtonVariant.text,
                icon: Icons.add,
                onPressed: onAddIssueTap,
              ),
            ],
          ),
          const SizedBox(height: PlaneSpacing.sm),
          issuesAsync.when(
            loading: PlaneLoadingShimmer.list,
            error: (error, _) => PlaneErrorWidget(
              message: 'Failed to load issues',
              detail: error.toString(),
            ),
            data: (issues) => CycleIssueList(
              issues: issues,
              onItemTap: onIssueTap,
            ),
          ),
        ],
      ),
    );
  }
}
