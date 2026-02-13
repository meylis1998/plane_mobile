import 'package:core_foundation/core_foundation.dart';

import 'package:domain_core/src/entities/module.dart';

abstract class ModuleRepository {
  FutureEither<List<Module>> getAll({
    required String workspaceSlug,
    required String projectId,
  });

  FutureEither<Module> getById({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  });

  FutureEither<Module> create({
    required String workspaceSlug,
    required String projectId,
    required Module module,
  });

  FutureEither<Module> update({
    required String workspaceSlug,
    required String projectId,
    required Module module,
  });
}
