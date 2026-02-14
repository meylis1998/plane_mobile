import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:data_repository/src/mappers/page_mapper.dart';
import 'package:domain_core/domain_core.dart';

class PageRepositoryImpl implements PageRepository {
  PageRepositoryImpl({required PlaneApiClient apiClient}) : _api = apiClient;

  final PlaneApiClient _api;

  @override
  FutureEither<List<Page>> getAll({
    required String workspaceSlug,
    required String projectId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/pages/',
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      final pages = results
          .cast<Map<String, dynamic>>()
          .map(PageMapper.fromJson)
          .toList();
      return Right(pages);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<Page> getById({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/pages/$pageId/',
      );
      final page = PageMapper.fromJson(response.data);
      return Right(page);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<Page> create({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  }) async {
    try {
      final response = await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/pages/',
        data: PageMapper.toJson(page),
      );
      final created = PageMapper.fromJson(response.data);
      return Right(created);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<Page> update({
    required String workspaceSlug,
    required String projectId,
    required Page page,
  }) async {
    try {
      final response = await _api.patch<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/pages/${page.id}/',
        data: PageMapper.toJson(page),
      );
      final updated = PageMapper.fromJson(response.data);
      return Right(updated);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureVoid delete({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  }) async {
    try {
      await _api.delete<void>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/pages/$pageId/',
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }
}
