import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_repository/src/mappers/comment_mapper.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:domain_core/domain_core.dart';

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl({
    required PlaneApiClient apiClient,
    required CommentDao commentDao,
  })  : _api = apiClient,
        _dao = commentDao;

  final PlaneApiClient _api;
  final CommentDao _dao;

  @override
  FutureEither<List<Comment>> getByWorkItem({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/'
        'work-items/$workItemId/comments/',
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      final comments = results
          .cast<Map<String, dynamic>>()
          .map(CommentMapper.fromJson)
          .toList();

      final companions = comments.map(CommentMapper.toCompanion).toList();
      await _dao.insertAll(companions);

      return Right(comments);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetByWorkItem(workItemId);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetByWorkItem(workItemId);
    }
  }

  @override
  FutureEither<Comment> create({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required Comment comment,
  }) async {
    try {
      final response = await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/'
        'work-items/$workItemId/comments/',
        data: {
          'comment_html': comment.body,
        },
      );
      final created = CommentMapper.fromJson(response.data);

      await _dao.insertOne(CommentMapper.toCompanion(created));

      return Right(created);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<Comment> update({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required Comment comment,
  }) async {
    try {
      final response = await _api.patch<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/'
        'work-items/$workItemId/comments/${comment.id}/',
        data: {
          'comment_html': comment.body,
        },
      );
      final updated = CommentMapper.fromJson(response.data);

      await _dao.insertOne(CommentMapper.toCompanion(updated));

      return Right(updated);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureVoid delete({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required String commentId,
  }) async {
    try {
      await _api.delete<void>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/'
        'work-items/$workItemId/comments/$commentId/',
      );
      await _dao.deleteById(commentId);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  Future<Either<Failure, List<Comment>>> _fallbackGetByWorkItem(
    String workItemId,
  ) async {
    try {
      final rows = await _dao.getByWorkItem(workItemId);
      if (rows.isEmpty) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(rows.map(CommentMapper.fromRow).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
