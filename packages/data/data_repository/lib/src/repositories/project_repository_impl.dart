import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:data_repository/src/mappers/project_mapper.dart';
import 'package:domain_core/domain_core.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl({
    required PlaneApiClient apiClient,
    required ProjectDao projectDao,
  })  : _api = apiClient,
        _dao = projectDao;

  final PlaneApiClient _api;
  final ProjectDao _dao;

  @override
  FutureEither<List<Project>> getAll({required String workspaceSlug}) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/',
      );
      final data = response.data;
      final results = (data['results'] as List<dynamic>?) ??
          (data is List ? data as List<dynamic> : <dynamic>[]);
      final projects = results
          .cast<Map<String, dynamic>>()
          .map(ProjectMapper.fromJson)
          .toList();

      final companions = projects.map(ProjectMapper.toCompanion).toList();
      await _dao.insertAll(companions);

      return Right(projects);
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
  FutureEither<Project> getById({
    required String workspaceSlug,
    required String projectId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/',
      );
      final project = ProjectMapper.fromJson(response.data);

      await _dao.insertOne(ProjectMapper.toCompanion(project));

      return Right(project);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetById(projectId);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetById(projectId);
    }
  }

  @override
  FutureEither<Project> create({
    required String workspaceSlug,
    required Project project,
  }) async {
    try {
      final response = await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/',
        data: {
          'name': project.name,
          if (project.description != null) 'description': project.description,
          if (project.identifier != null) 'identifier': project.identifier,
          if (project.emoji != null) 'emoji': project.emoji,
          if (project.network != null) 'network': project.network!.value,
        },
      );
      final created = ProjectMapper.fromJson(response.data);

      await _dao.insertOne(ProjectMapper.toCompanion(created));

      return Right(created);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<Project> update({
    required String workspaceSlug,
    required Project project,
  }) async {
    try {
      final response = await _api.patch<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/${project.id}/',
        data: {
          'name': project.name,
          if (project.description != null) 'description': project.description,
          if (project.emoji != null) 'emoji': project.emoji,
          if (project.network != null) 'network': project.network!.value,
        },
      );
      final updated = ProjectMapper.fromJson(response.data);

      await _dao.insertOne(ProjectMapper.toCompanion(updated));

      return Right(updated);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureVoid delete({
    required String workspaceSlug,
    required String projectId,
  }) async {
    try {
      await _api.delete<void>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/',
      );
      await _dao.deleteById(projectId);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<List<Project>> getFavorites({
    required String workspaceSlug,
  }) async {
    try {
      final allResult = await getAll(workspaceSlug: workspaceSlug);
      return allResult.map(
        (projects) => projects.where((p) => p.isFavorite).toList(),
      );
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetFavorites();
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (_) {
      return _fallbackGetFavorites();
    }
  }

  Future<Either<Failure, List<Project>>> _fallbackGetAll() async {
    try {
      final rows = await _dao.getAll();
      if (rows.isEmpty) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(rows.map(ProjectMapper.fromRow).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, Project>> _fallbackGetById(String id) async {
    try {
      final row = await _dao.getById(id);
      if (row == null) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(ProjectMapper.fromRow(row));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<Project>>> _fallbackGetFavorites() async {
    try {
      final rows = await _dao.getFavorites();
      return Right(rows.map(ProjectMapper.fromRow).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
