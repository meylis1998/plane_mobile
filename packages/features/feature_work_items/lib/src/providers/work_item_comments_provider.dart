import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_comments_provider.g.dart';

/// Provider for the comment repository.
/// Must be overridden at the app level with a concrete implementation.
@Riverpod(keepAlive: true)
class CommentRepositoryNotifier extends _$CommentRepositoryNotifier {
  @override
  CommentRepository build() {
    throw UnimplementedError(
      'commentRepositoryNotifierProvider must be overridden',
    );
  }
}

@riverpod
class WorkItemComments extends _$WorkItemComments {
  @override
  Future<List<Comment>> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    final repository = ref.watch(commentRepositoryNotifierProvider);
    final result = await repository.getByWorkItem(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
    return result.fold(
      (failure) => throw failure,
      (comments) => comments,
    );
  }

  Future<void> addComment({
    required String body,
    required String createdById,
  }) async {
    final repository = ref.read(commentRepositoryNotifierProvider);
    final comment = Comment(
      id: '',
      workItemId: workItemId,
      body: body,
      createdById: createdById,
    );
    final result = await repository.create(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
      comment: comment,
    );
    result.fold(
      (failure) => throw failure,
      (_) => ref.invalidateSelf(),
    );
  }
}
