import 'package:core_foundation/core_foundation.dart';

import 'package:domain_core/src/entities/workspace.dart';

abstract class WorkspaceRepository {
  FutureEither<List<Workspace>> getAll();

  FutureEither<Workspace> getBySlug({required String slug});
}
