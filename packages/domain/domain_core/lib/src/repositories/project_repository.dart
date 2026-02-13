import 'package:core_foundation/core_foundation.dart';

import 'package:domain_core/src/entities/project.dart';

abstract class ProjectRepository {
  FutureEither<List<Project>> getAll({required String workspaceSlug});

  FutureEither<Project> getById({
    required String workspaceSlug,
    required String projectId,
  });

  FutureEither<Project> create({
    required String workspaceSlug,
    required Project project,
  });

  FutureEither<Project> update({
    required String workspaceSlug,
    required Project project,
  });

  FutureVoid delete({
    required String workspaceSlug,
    required String projectId,
  });

  FutureEither<List<Project>> getFavorites({required String workspaceSlug});
}
