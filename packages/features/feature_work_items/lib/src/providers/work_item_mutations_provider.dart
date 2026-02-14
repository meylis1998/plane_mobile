import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/work_item_detail_provider.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_mutations_provider.g.dart';

@riverpod
class WorkItemMutations extends _$WorkItemMutations {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<Either<Failure, WorkItem>> createWorkItem({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(workItemRepositoryNotifierProvider);
    final result = await repository.create(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItem: workItem,
    );
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (_) {
        state = const AsyncData(null);
        ref.invalidate(
          workItemListProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
          ),
        );
      },
    );
    return result;
  }

  Future<Either<Failure, WorkItem>> updateWorkItem({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(workItemRepositoryNotifierProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItem: workItem,
    );
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (updated) {
        state = const AsyncData(null);
        ref
          ..invalidate(
            workItemDetailProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
              workItemId: workItem.id,
            ),
          )
          ..invalidate(
            workItemListProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
            ),
          );
      },
    );
    return result;
  }

  Future<Either<Failure, void>> deleteWorkItem({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(workItemRepositoryNotifierProvider);
    final result = await repository.delete(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (_) {
        state = const AsyncData(null);
        ref.invalidate(
          workItemListProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
          ),
        );
      },
    );
    return result;
  }

  Future<Either<Failure, WorkItem>> updateState({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
    required WorkItemState newState,
  }) async {
    final updated = workItem.copyWith(state: newState);
    return updateWorkItem(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItem: updated,
    );
  }

  Future<Either<Failure, WorkItem>> updatePriority({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
    required Priority newPriority,
  }) async {
    final updated = workItem.copyWith(priority: newPriority);
    return updateWorkItem(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItem: updated,
    );
  }
}
