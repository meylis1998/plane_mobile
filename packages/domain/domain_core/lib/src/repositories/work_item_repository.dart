import 'package:core_foundation/core_foundation.dart';

import 'package:domain_core/src/entities/work_item.dart';

abstract class WorkItemRepository {
  FutureEither<List<WorkItem>> getAll({
    required String workspaceSlug,
    required String projectId,
  });

  FutureEither<WorkItem> getById({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });

  FutureEither<WorkItem> create({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
  });

  FutureEither<WorkItem> update({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
  });

  FutureVoid delete({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });

  FutureEither<List<WorkItem>> search({
    required String workspaceSlug,
    required String query,
  });

  FutureEither<List<WorkItem>> getByFilter({
    required String workspaceSlug,
    required String projectId,
    Map<String, dynamic>? filters,
  });
}
