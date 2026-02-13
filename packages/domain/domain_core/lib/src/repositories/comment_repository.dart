import 'package:core_foundation/core_foundation.dart';

import 'package:domain_core/src/entities/comment.dart';

abstract class CommentRepository {
  FutureEither<List<Comment>> getByWorkItem({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });

  FutureEither<Comment> create({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required Comment comment,
  });

  FutureEither<Comment> update({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required Comment comment,
  });

  FutureVoid delete({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required String commentId,
  });
}
