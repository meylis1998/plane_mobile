import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:data_repository/src/mappers/workspace_mapper.dart';
import 'package:domain_core/domain_core.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  WorkspaceRepositoryImpl({
    required PlaneApiClient apiClient,
    required WorkspaceDao workspaceDao,
  })  : _api = apiClient,
        _dao = workspaceDao;

  final PlaneApiClient _api;
  final WorkspaceDao _dao;

  @override
  FutureEither<List<Workspace>> getAll() async {
    try {
      final response = await _api.get<List<dynamic>>('/api/v1/workspaces/');
      final workspaces = response.data
          .cast<Map<String, dynamic>>()
          .map(WorkspaceMapper.fromJson)
          .toList();

      // Cache locally
      final companions = workspaces.map(WorkspaceMapper.toCompanion).toList();
      await _dao.insertAll(companions);

      return Right(workspaces);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetAll();
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetAll();
    }
  }

  @override
  FutureEither<Workspace> getBySlug({required String slug}) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$slug/',
      );
      final workspace = WorkspaceMapper.fromJson(response.data);

      await _dao.insertOne(WorkspaceMapper.toCompanion(workspace));

      return Right(workspace);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetBySlug(slug);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetBySlug(slug);
    }
  }

  Future<Either<Failure, List<Workspace>>> _fallbackGetAll() async {
    try {
      final rows = await _dao.getAll();
      if (rows.isEmpty) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(rows.map(WorkspaceMapper.fromRow).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, Workspace>> _fallbackGetBySlug(String slug) async {
    try {
      final row = await _dao.getBySlug(slug);
      if (row == null) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(WorkspaceMapper.fromRow(row));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
