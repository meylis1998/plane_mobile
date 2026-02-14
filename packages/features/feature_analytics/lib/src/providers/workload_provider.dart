import 'package:feature_analytics/src/models/workload_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workload_provider.g.dart';

/// Sort options for workload data.
enum WorkloadSortOrder { mostAssigned, leastAssigned }

/// Provides workload distribution across team members for a project.
@riverpod
Future<List<WorkloadItem>> workload(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  WorkloadSortOrder sort = WorkloadSortOrder.mostAssigned,
}) async {
  // Simulate network delay
  await Future<void>.delayed(const Duration(milliseconds: 300));

  // Sample workload data — a real implementation would call:
  // GET /api/v1/workspaces/{slug}/projects/{id}/members/
  // and correlate with work item assignments
  var items = <WorkloadItem>[
    const WorkloadItem(
      memberId: '1',
      memberName: 'Alice Chen',
      assignedCount: 32,
      completedCount: 24,
    ),
    const WorkloadItem(
      memberId: '2',
      memberName: 'Bob Smith',
      assignedCount: 28,
      completedCount: 20,
    ),
    const WorkloadItem(
      memberId: '3',
      memberName: 'Carol Davis',
      assignedCount: 24,
      completedCount: 19,
    ),
    const WorkloadItem(
      memberId: '4',
      memberName: 'Dan Wilson',
      assignedCount: 18,
      completedCount: 12,
    ),
    const WorkloadItem(
      memberId: '5',
      memberName: 'Eve Martinez',
      assignedCount: 22,
      completedCount: 18,
    ),
    const WorkloadItem(
      memberId: '6',
      memberName: 'Frank Lee',
      assignedCount: 18,
      completedCount: 14,
    ),
  ];

  items = List<WorkloadItem>.from(items);
  switch (sort) {
    case WorkloadSortOrder.mostAssigned:
      items.sort((a, b) => b.assignedCount.compareTo(a.assignedCount));
    case WorkloadSortOrder.leastAssigned:
      items.sort((a, b) => a.assignedCount.compareTo(b.assignedCount));
  }

  return items;
}
