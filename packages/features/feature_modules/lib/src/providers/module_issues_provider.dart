import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module_issues_provider.g.dart';

/// Stub provider for WorkItemRepository.
/// Must be overridden at the app level with a concrete implementation.
@Riverpod(keepAlive: true)
WorkItemRepository moduleWorkItemRepository(Ref ref) {
  throw UnimplementedError(
    'moduleWorkItemRepositoryProvider must be overridden in ProviderScope',
  );
}

/// Fetches work items assigned to a specific module.
@riverpod
Future<List<WorkItem>> moduleIssues(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String moduleId,
}) async {
  final repository = ref.watch(moduleWorkItemRepositoryProvider);
  final result = await repository.getByFilter(
    workspaceSlug: workspaceSlug,
    projectId: projectId,
    filters: {'module': moduleId},
  );
  return result.fold(
    (failure) => throw Exception(failure.message),
    (items) => items,
  );
}
