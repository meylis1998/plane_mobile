import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_detail_provider.g.dart';

@riverpod
class WorkItemDetail extends _$WorkItemDetail {
  @override
  Future<WorkItem> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    final repository = ref.watch(workItemRepositoryNotifierProvider);
    final result = await repository.getById(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
    return result.fold(
      (failure) => throw failure,
      (item) => item,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
