import 'package:core_foundation/core_foundation.dart';

import 'package:domain_core/src/entities/cycle.dart';

abstract class CycleRepository {
  FutureEither<List<Cycle>> getAll({
    required String workspaceSlug,
    required String projectId,
  });

  FutureEither<Cycle> getById({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  });

  FutureEither<Cycle> create({
    required String workspaceSlug,
    required String projectId,
    required Cycle cycle,
  });

  FutureEither<Cycle> update({
    required String workspaceSlug,
    required String projectId,
    required Cycle cycle,
  });
}
