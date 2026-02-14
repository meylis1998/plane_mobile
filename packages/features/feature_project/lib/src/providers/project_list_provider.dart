import 'package:core_foundation/core_foundation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_list_provider.g.dart';

@riverpod
class ProjectList extends _$ProjectList {
  @override
  Future<List<Project>> build({required String workspaceSlug}) async {
    final repository = ref.watch(projectRepositoryProvider);
    final result = await repository.getAll(workspaceSlug: workspaceSlug);
    return result.fold(
      (Failure failure) => throw Exception(failure.message),
      (List<Project> projects) => projects,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    ref.invalidateSelf();
  }
}
