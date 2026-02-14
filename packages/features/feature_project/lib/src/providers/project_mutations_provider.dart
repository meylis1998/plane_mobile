import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/favorite_projects_provider.dart';
import 'package:feature_project/src/providers/project_list_provider.dart';
import 'package:feature_project/src/providers/project_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_mutations_provider.g.dart';

@riverpod
class ProjectMutations extends _$ProjectMutations {
  @override
  Object? build() => null;

  /// Toggles the isFavorite flag on a project.
  /// Calls the server, then invalidates both list and favorites caches.
  Future<void> toggleFavorite({
    required String workspaceSlug,
    required Project project,
  }) async {
    final toggled = project.copyWith(
      isFavorite: !project.isFavorite,
    );

    final repository = ref.read(projectRepositoryProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      project: toggled,
    );

    result.fold(
      (_) {
        // No-op on failure; list stays as-is
      },
      (_) {
        ref
          ..invalidate(
            projectListProvider(
              workspaceSlug: workspaceSlug,
            ),
          )
          ..invalidate(
            favoriteProjectsProvider(
              workspaceSlug: workspaceSlug,
            ),
          );
      },
    );
  }

  /// Creates a new project.
  Future<Project?> createProject({
    required String workspaceSlug,
    required Project project,
  }) async {
    final repository = ref.read(projectRepositoryProvider);
    final result = await repository.create(
      workspaceSlug: workspaceSlug,
      project: project,
    );

    return result.fold(
      (_) => null,
      (Project created) {
        ref.invalidate(
          projectListProvider(workspaceSlug: workspaceSlug),
        );
        return created;
      },
    );
  }

  /// Deletes a project.
  Future<bool> deleteProject({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final repository = ref.read(projectRepositoryProvider);
    final result = await repository.delete(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );

    return result.fold(
      (_) => false,
      (_) {
        ref.invalidate(
          projectListProvider(workspaceSlug: workspaceSlug),
        );
        return true;
      },
    );
  }
}
