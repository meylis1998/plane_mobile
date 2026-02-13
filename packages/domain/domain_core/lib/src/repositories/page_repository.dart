import 'package:core_foundation/core_foundation.dart';

import 'package:domain_core/src/entities/page.dart';

abstract class PageRepository {
  FutureEither<List<Page>> getAll({
    required String workspaceSlug,
    required String projectId,
  });

  FutureEither<Page> getById({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  });

  FutureEither<Page> create({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  });

  FutureEither<Page> update({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  });

  FutureVoid delete({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  });
}
