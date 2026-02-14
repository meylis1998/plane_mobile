import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_states_provider.g.dart';

@riverpod
class ProjectStatesNotifier extends _$ProjectStatesNotifier {
  @override
  Future<List<WorkItemState>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final repository = ref.watch(projectRepositoryNotifierProvider);
    final result = await repository.getById(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
    return result.fold(
      (failure) => throw failure,
      (project) => project.states ?? [],
    );
  }
}

/// Provider for the project repository.
/// Must be overridden at the app level with a concrete implementation.
@Riverpod(keepAlive: true)
class ProjectRepositoryNotifier extends _$ProjectRepositoryNotifier {
  @override
  ProjectRepository build() {
    throw UnimplementedError(
      'projectRepositoryNotifierProvider must be overridden',
    );
  }
}
