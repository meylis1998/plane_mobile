import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/providers/cycle_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_issues_provider.g.dart';

/// Provider that returns work items assigned to a specific cycle.
/// This watches the work item repository (via the cycle list provider's
/// repository) and filters items by cycle ID.
///
/// In a full implementation this would call a dedicated cycle-issues endpoint.
/// For now it uses the work item repository's getByFilter with cycleId filter.
@riverpod
Future<List<WorkItem>> cycleIssues(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String cycleId,
}) async {
  // Re-fetch whenever the cycle list changes (e.g. after adding an issue)
  ref.watch(
    cycleListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ),
  );

  // In a real implementation this would call a dedicated API endpoint:
  // GET /api/v1/workspaces/{slug}/projects/{id}/cycles/{cycleId}/cycle-issues/
  // For now we return an empty list as a stub.
  return <WorkItem>[];
}
