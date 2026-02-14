import 'package:feature_analytics/src/providers/project_analytics_provider.dart';
import 'package:feature_analytics/src/widgets/analytics_stat_card.dart';
import 'package:feature_analytics/src/widgets/completion_trend_chart.dart';
import 'package:feature_analytics/src/widgets/issues_by_priority_chart.dart';
import 'package:feature_analytics/src/widgets/issues_by_state_chart.dart';
import 'package:feature_analytics/src/widgets/velocity_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Dashboard screen displaying project-level analytics:
/// summary cards, issues by state donut chart, issues by priority bar chart,
/// completion trend line chart, and velocity chart.
class ProjectAnalyticsScreen extends ConsumerWidget {
  const ProjectAnalyticsScreen({
    required this.workspaceSlug,
    required this.projectId,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(
      projectAnalyticsProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Analytics'),
      ),
      body: analyticsAsync.when(
        loading: PlaneLoadingShimmer.chart,
        error: (error, _) => Center(
          child: PlaneErrorWidget(
            message: 'Failed to load analytics',
            onRetry: () => ref.invalidate(
              projectAnalyticsProvider(
                workspaceSlug: workspaceSlug,
                projectId: projectId,
              ),
            ),
          ),
        ),
        data: (analytics) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(
              projectAnalyticsProvider(
                workspaceSlug: workspaceSlug,
                projectId: projectId,
              ),
            );
            // Wait for the new data to load
            await ref.read(
              projectAnalyticsProvider(
                workspaceSlug: workspaceSlug,
                projectId: projectId,
              ).future,
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(PlaneSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary stat cards
                _SummaryCards(
                  totalIssues: analytics.totalIssues,
                  completedIssues: analytics.completedIssues,
                  openIssues: analytics.openIssues,
                  overdueIssues: analytics.overdueIssues,
                ),
                const SizedBox(height: PlaneSpacing.lg),

                // Issues by State donut chart
                Text(
                  'Issues by State',
                  style: PlaneTypography.titleSmall.copyWith(
                    color: PlaneColors.grey800,
                  ),
                ),
                const SizedBox(height: PlaneSpacing.sm),
                IssuesByStateChart(
                  issuesByState: analytics.issuesByState,
                ),
                const SizedBox(height: PlaneSpacing.lg),

                // Issues by Priority bar chart
                Text(
                  'Issues by Priority',
                  style: PlaneTypography.titleSmall.copyWith(
                    color: PlaneColors.grey800,
                  ),
                ),
                const SizedBox(height: PlaneSpacing.sm),
                IssuesByPriorityChart(
                  issuesByPriority: analytics.issuesByPriority,
                ),
                const SizedBox(height: PlaneSpacing.lg),

                // Completion trend line chart
                Text(
                  'Completion Trend',
                  style: PlaneTypography.titleSmall.copyWith(
                    color: PlaneColors.grey800,
                  ),
                ),
                const SizedBox(height: PlaneSpacing.sm),
                const CompletionTrendChart(),
                const SizedBox(height: PlaneSpacing.lg),

                // Velocity chart
                Text(
                  'Sprint Velocity',
                  style: PlaneTypography.titleSmall.copyWith(
                    color: PlaneColors.grey800,
                  ),
                ),
                const SizedBox(height: PlaneSpacing.sm),
                const VelocityChart(),
                const SizedBox(height: PlaneSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryCards extends StatelessWidget {
  const _SummaryCards({
    required this.totalIssues,
    required this.completedIssues,
    required this.openIssues,
    required this.overdueIssues,
  });

  final int totalIssues;
  final int completedIssues;
  final int openIssues;
  final int overdueIssues;

  @override
  Widget build(BuildContext context) {
    final denom = totalIssues == 0 ? 1 : totalIssues;
    final completionPct =
        (completedIssues / denom * 100).round();

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: PlaneSpacing.sm,
      crossAxisSpacing: PlaneSpacing.sm,
      childAspectRatio: 1.7,
      children: [
        AnalyticsStatCard(
          value: totalIssues.toString(),
          label: 'Total Issues',
          color: PlaneColors.primary,
        ),
        AnalyticsStatCard(
          value: completedIssues.toString(),
          label: 'Completed',
          trend: '$completionPct%',
          color: PlaneColors.success,
        ),
        AnalyticsStatCard(
          value: openIssues.toString(),
          label: 'Open Issues',
          color: PlaneColors.warning,
        ),
        AnalyticsStatCard(
          value: overdueIssues.toString(),
          label: 'Overdue',
          trend: overdueIssues > 0 ? '$overdueIssues' : null,
          trendPositive: false,
          color: PlaneColors.error,
        ),
      ],
    );
  }
}
