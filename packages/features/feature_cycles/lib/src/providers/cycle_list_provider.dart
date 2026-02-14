import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/providers/cycle_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_list_provider.g.dart';

@riverpod
class CycleList extends _$CycleList {
  @override
  Future<List<Cycle>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final repository = ref.watch(cycleRepositoryProvider);
    final result = await repository.getAll(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
    return result.fold(
      (Failure failure) => throw Exception(failure.message),
      (List<Cycle> cycles) => cycles,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
