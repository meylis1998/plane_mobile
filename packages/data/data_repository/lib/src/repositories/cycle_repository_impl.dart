import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_repository/src/mappers/cycle_mapper.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:domain_core/domain_core.dart';

class CycleRepositoryImpl implements CycleRepository {
  CycleRepositoryImpl({
    required PlaneApiClient apiClient,
    required CycleDao cycleDao,
  })  : _api = apiClient,
        _dao = cycleDao;

  final PlaneApiClient _api;
  final CycleDao _dao;

  @override
  FutureEither<List<Cycle>> getAll({
    required String workspaceSlug,
    required String projectId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/cycles/',
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      final cycles = results
          .cast<Map<String, dynamic>>()
          .map(CycleMapper.fromJson)
          .toList();

      final companions = cycles.map(CycleMapper.toCompanion).toList();
      await _dao.insertAll(companions);

      return Right(cycles);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetByProject(projectId);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetByProject(projectId);
    }
  }

  @override
  FutureEither<Cycle> getById({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/cycles/$cycleId/',
      );
      final cycle = CycleMapper.fromJson(response.data);

      await _dao.insertOne(CycleMapper.toCompanion(cycle));

      return Right(cycle);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetById(cycleId);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetById(cycleId);
    }
  }

  @override
  FutureEither<Cycle> create({
    required String workspaceSlug,
    required String projectId,
    required Cycle cycle,
  }) async {
    try {
      final response = await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/cycles/',
        data: {
          'name': cycle.name,
          if (cycle.description != null) 'description': cycle.description,
          if (cycle.startDate != null)
            'start_date': cycle.startDate!.toIso8601String().split('T').first,
          if (cycle.endDate != null)
            'end_date': cycle.endDate!.toIso8601String().split('T').first,
        },
      );
      final created = CycleMapper.fromJson(response.data);

      await _dao.insertOne(CycleMapper.toCompanion(created));

      return Right(created);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<Cycle> update({
    required String workspaceSlug,
    required String projectId,
    required Cycle cycle,
  }) async {
    try {
      final response = await _api.patch<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/cycles/${cycle.id}/',
        data: {
          'name': cycle.name,
          if (cycle.description != null) 'description': cycle.description,
          if (cycle.startDate != null)
            'start_date': cycle.startDate!.toIso8601String().split('T').first,
          if (cycle.endDate != null)
            'end_date': cycle.endDate!.toIso8601String().split('T').first,
        },
      );
      final updated = CycleMapper.fromJson(response.data);

      await _dao.insertOne(CycleMapper.toCompanion(updated));

      return Right(updated);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  Future<Either<Failure, List<Cycle>>> _fallbackGetByProject(
    String projectId,
  ) async {
    try {
      final rows = await _dao.getByProject(projectId);
      if (rows.isEmpty) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(rows.map(CycleMapper.fromRow).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, Cycle>> _fallbackGetById(String id) async {
    try {
      final row = await _dao.getById(id);
      if (row == null) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(CycleMapper.fromRow(row));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
