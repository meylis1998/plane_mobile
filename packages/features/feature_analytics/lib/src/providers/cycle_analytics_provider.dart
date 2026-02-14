import 'package:domain_core/domain_core.dart';
import 'package:feature_analytics/src/models/burndown_point.dart';
import 'package:feature_analytics/src/models/cycle_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_analytics_provider.g.dart';

/// Provides cycle-level analytics including velocity, completion rate,
/// burndown data, and issue distribution by state.
@riverpod
Future<CycleAnalytics> cycleAnalyticsDetail(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String cycleId,
}) async {
  // Simulate network delay
  await Future<void>.delayed(const Duration(milliseconds: 300));

  // Sample cycle analytics — a real implementation would call:
  // GET /api/v1/workspaces/{slug}/projects/{id}/cycles/{cycleId}/analytics/

  // Generate 14-day burndown data
  final now = DateTime.now();
  final startDate = now.subtract(const Duration(days: 13));
  const totalIssues = 40;
  const completedIssues = 28;

  final burndownData = <BurndownPoint>[];
  for (var i = 0; i <= 13; i++) {
    final date = startDate.add(Duration(days: i));
    final ideal = totalIssues * (1 - i / 13);
    // Actual: slightly behind ideal, with some variance
    final progress = i / 13;
    final actualCompleted = (completedIssues * progress).round();
    final actual = (totalIssues - actualCompleted).toDouble();
    burndownData.add(
      BurndownPoint(
        date: date,
        ideal: ideal,
        actual: actual,
      ),
    );
  }

  final issuesByState = <StateGroup, int>{
    StateGroup.backlog: 3,
    StateGroup.unstarted: 4,
    StateGroup.started: 5,
    StateGroup.completed: 28,
    StateGroup.cancelled: 0,
  };

  return CycleAnalytics(
    velocity: 28,
    completionRate: completedIssues / totalIssues * 100,
    burndownData: burndownData,
    issuesByState: issuesByState,
  );
}
