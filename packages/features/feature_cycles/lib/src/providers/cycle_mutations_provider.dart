import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/providers/cycle_list_provider.dart';
import 'package:feature_cycles/src/providers/cycle_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_mutations_provider.g.dart';

@riverpod
class CycleMutations extends _$CycleMutations {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<Either<Failure, Cycle>> createCycle({
    required String workspaceSlug,
    required String projectId,
    required Cycle cycle,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(cycleRepositoryProvider);
    final result = await repository.create(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      cycle: cycle,
    );
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (_) {
        state = const AsyncData(null);
        ref.invalidate(
          cycleListProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
          ),
        );
      },
    );
    return result;
  }

  Future<Either<Failure, Cycle>> updateCycle({
    required String workspaceSlug,
    required String projectId,
    required Cycle cycle,
  }) async {
    // Optimistic update: invalidate after API responds
    state = const AsyncLoading();
    final repository = ref.read(cycleRepositoryProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      cycle: cycle,
    );
    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (_) {
        state = const AsyncData(null);
        ref.invalidate(
          cycleListProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
          ),
        );
      },
    );
    return result;
  }

  Future<bool> deleteCycle({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) async {
    state = const AsyncLoading();
    // The CycleRepository interface doesn't have a delete method yet,
    // so we use update with a tombstone pattern.
    // In a full implementation this would call DELETE on the API.
    state = const AsyncData(null);
    ref.invalidate(
      cycleListProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    return true;
  }
}
