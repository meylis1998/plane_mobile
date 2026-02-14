import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/providers/module_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module_list_provider.g.dart';

@riverpod
class ModuleList extends _$ModuleList {
  @override
  Future<List<Module>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final repository = ref.watch(moduleRepositoryProvider);
    final result = await repository.getAll(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
    return result.fold(
      (Failure failure) => throw Exception(failure.message),
      (List<Module> modules) => modules,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    ref.invalidateSelf();
  }
}
