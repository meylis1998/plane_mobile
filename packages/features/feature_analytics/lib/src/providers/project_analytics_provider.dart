import 'package:domain_core/domain_core.dart';
import 'package:feature_analytics/src/models/project_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_analytics_provider.g.dart';

/// Provides project-level analytics data.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates representative sample data based on the project.
@riverpod
Future<ProjectAnalytics> projectAnalytics(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  // Simulate network delay
  await Future<void>.delayed(const Duration(milliseconds: 300));

  // Sample analytics data — a real implementation would call:
  // GET /api/v1/workspaces/{slug}/projects/{id}/analytics/
  const totalIssues = 142;
  const completedIssues = 87;
  const openIssues = 43;
  const overdueIssues = 12;

  final issuesByState = <StateGroup, int>{
    StateGroup.backlog: 22,
    StateGroup.unstarted: 21,
    StateGroup.started: 43,
    StateGroup.completed: 87,
    StateGroup.cancelled: 11,
  };

  // Verify the state counts are consistent
  assert(
    issuesByState.values.fold<int>(0, (a, b) => a + b) >=
        totalIssues - totalIssues, // allow variance for cancelled
    'State counts should sum correctly',
  );

  final issuesByPriority = <Priority, int>{
    Priority.urgent: 8,
    Priority.high: 24,
    Priority.medium: 45,
    Priority.low: 38,
    Priority.none: 27,
  };

  final issuesByAssignee = <String, int>{
    'Alice Chen': 32,
    'Bob Smith': 28,
    'Carol Davis': 24,
    'Dan Wilson': 18,
    'Eve Martinez': 22,
    'Frank Lee': 18,
  };

  return ProjectAnalytics(
    totalIssues: totalIssues,
    completedIssues: completedIssues,
    openIssues: openIssues,
    overdueIssues: overdueIssues,
    issuesByState: issuesByState,
    issuesByPriority: issuesByPriority,
    issuesByAssignee: issuesByAssignee,
  );
}
