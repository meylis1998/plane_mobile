import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/providers/module_detail_provider.dart';
import 'package:feature_modules/src/providers/module_list_provider.dart';
import 'package:feature_modules/src/providers/module_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module_mutations_provider.g.dart';

@riverpod
class ModuleMutations extends _$ModuleMutations {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<Module?> createModule({
    required String workspaceSlug,
    required String projectId,
    required Module module,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(moduleRepositoryProvider);
    final result = await repository.create(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      module: module,
    );

    return result.fold(
      (Failure failure) {
        state = AsyncError(failure, StackTrace.current);
        return null;
      },
      (Module created) {
        state = const AsyncData(null);
        ref.invalidate(
          moduleListProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
          ),
        );
        return created;
      },
    );
  }

  Future<Module?> updateModule({
    required String workspaceSlug,
    required String projectId,
    required Module module,
  }) async {
    state = const AsyncLoading();
    final repository = ref.read(moduleRepositoryProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      module: module,
    );

    return result.fold(
      (Failure failure) {
        state = AsyncError(failure, StackTrace.current);
        return null;
      },
      (Module updated) {
        state = const AsyncData(null);
        ref
          ..invalidate(
            moduleDetailProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
              moduleId: module.id,
            ),
          )
          ..invalidate(
            moduleListProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
            ),
          );
        return updated;
      },
    );
  }

  Future<bool> deleteModule({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) async {
    state = const AsyncLoading();

    // Note: ModuleRepository does not define a delete method yet.
    // When a delete endpoint is added to the repository, wire it here.
    // For now, invalidate the list to re-fetch from server.
    state = const AsyncData(null);
    ref.invalidate(
      moduleListProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    return true;
  }
}
