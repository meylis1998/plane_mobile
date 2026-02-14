import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:data_repository/src/mappers/module_mapper.dart';
import 'package:domain_core/domain_core.dart';

class ModuleRepositoryImpl implements ModuleRepository {
  ModuleRepositoryImpl({
    required PlaneApiClient apiClient,
    required ModuleDao moduleDao,
  })  : _api = apiClient,
        _dao = moduleDao;

  final PlaneApiClient _api;
  final ModuleDao _dao;

  @override
  FutureEither<List<Module>> getAll({
    required String workspaceSlug,
    required String projectId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/modules/',
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      final modules = results
          .cast<Map<String, dynamic>>()
          .map(ModuleMapper.fromJson)
          .toList();

      final companions = modules.map(ModuleMapper.toCompanion).toList();
      await _dao.insertAll(companions);

      return Right(modules);
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
  FutureEither<Module> getById({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/modules/$moduleId/',
      );
      final module = ModuleMapper.fromJson(response.data);

      await _dao.insertOne(ModuleMapper.toCompanion(module));

      return Right(module);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetById(moduleId);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetById(moduleId);
    }
  }

  @override
  FutureEither<Module> create({
    required String workspaceSlug,
    required String projectId,
    required Module module,
  }) async {
    try {
      final response = await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/modules/',
        data: {
          'name': module.name,
          if (module.description != null) 'description': module.description,
          if (module.startDate != null)
            'start_date':
                module.startDate!.toIso8601String().split('T').first,
          if (module.targetDate != null)
            'target_date':
                module.targetDate!.toIso8601String().split('T').first,
        },
      );
      final created = ModuleMapper.fromJson(response.data);

      await _dao.insertOne(ModuleMapper.toCompanion(created));

      return Right(created);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<Module> update({
    required String workspaceSlug,
    required String projectId,
    required Module module,
  }) async {
    try {
      final response = await _api.patch<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/modules/${module.id}/',
        data: {
          'name': module.name,
          if (module.description != null) 'description': module.description,
          if (module.startDate != null)
            'start_date':
                module.startDate!.toIso8601String().split('T').first,
          if (module.targetDate != null)
            'target_date':
                module.targetDate!.toIso8601String().split('T').first,
        },
      );
      final updated = ModuleMapper.fromJson(response.data);

      await _dao.insertOne(ModuleMapper.toCompanion(updated));

      return Right(updated);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  Future<Either<Failure, List<Module>>> _fallbackGetByProject(
    String projectId,
  ) async {
    try {
      final rows = await _dao.getByProject(projectId);
      if (rows.isEmpty) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(rows.map(ModuleMapper.fromRow).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, Module>> _fallbackGetById(String id) async {
    try {
      final row = await _dao.getById(id);
      if (row == null) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(ModuleMapper.fromRow(row));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
