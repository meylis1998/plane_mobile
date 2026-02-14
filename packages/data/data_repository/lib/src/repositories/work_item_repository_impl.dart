import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:data_repository/src/mappers/work_item_mapper.dart';
import 'package:domain_core/domain_core.dart';

class WorkItemRepositoryImpl implements WorkItemRepository {
  WorkItemRepositoryImpl({
    required PlaneApiClient apiClient,
    required WorkItemDao workItemDao,
    required StateDao stateDao,
  })  : _api = apiClient,
        _workItemDao = workItemDao,
        _stateDao = stateDao;

  final PlaneApiClient _api;
  final WorkItemDao _workItemDao;
  final StateDao _stateDao;

  @override
  FutureEither<List<WorkItem>> getAll({
    required String workspaceSlug,
    required String projectId,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/work-items/',
        queryParameters: {'expand': 'state'},
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      final items = results
          .cast<Map<String, dynamic>>()
          .map((json) => WorkItemMapper.fromJson(
                {...json, 'workspace_slug': workspaceSlug},
              ))
          .toList();

      final companions = items.map(WorkItemMapper.toCompanion).toList();
      await _workItemDao.insertAll(companions);

      return Right(items);
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
  FutureEither<WorkItem> getById({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    try {
      final path = '/api/v1/workspaces/$workspaceSlug'
          '/projects/$projectId'
          '/work-items/$workItemId/';
      final response = await _api.get<Map<String, dynamic>>(
        path,
        queryParameters: {
          'expand': 'state,assignees,labels',
        },
      );
      final item = WorkItemMapper.fromJson(
        {...response.data, 'workspace_slug': workspaceSlug},
      );

      await _workItemDao.insertOne(WorkItemMapper.toCompanion(item));

      return Right(item);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetById(workItemId);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetById(workItemId);
    }
  }

  @override
  FutureEither<WorkItem> create({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
  }) async {
    try {
      final response = await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/work-items/',
        data: {
          'name': workItem.name,
          if (workItem.description != null)
            'description': workItem.description,
          if (workItem.descriptionHtml != null)
            'description_html': workItem.descriptionHtml,
          'state': workItem.state.id,
          'priority': workItem.priority.name,
          if (workItem.startDate != null)
            'start_date': _dateStr(workItem.startDate!),
          if (workItem.targetDate != null)
            'target_date': _dateStr(workItem.targetDate!),
          if (workItem.parentId != null)
            'parent': workItem.parentId,
          if (workItem.assigneeIds != null)
            'assignees': workItem.assigneeIds,
          if (workItem.labelIds != null)
            'labels': workItem.labelIds,
          if (workItem.estimate != null)
            'estimate_point': workItem.estimate,
        },
      );
      final created = WorkItemMapper.fromJson(
        {...response.data, 'workspace_slug': workspaceSlug},
      );

      await _workItemDao.insertOne(
        WorkItemMapper.toCompanion(created),
      );

      return Right(created);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<WorkItem> update({
    required String workspaceSlug,
    required String projectId,
    required WorkItem workItem,
  }) async {
    try {
      final path = '/api/v1/workspaces/$workspaceSlug'
          '/projects/$projectId'
          '/work-items/${workItem.id}/';
      final response = await _api.patch<Map<String, dynamic>>(
        path,
        data: {
          'name': workItem.name,
          if (workItem.description != null)
            'description': workItem.description,
          'state': workItem.state.id,
          'priority': workItem.priority.name,
          if (workItem.startDate != null)
            'start_date': _dateStr(workItem.startDate!),
          if (workItem.targetDate != null)
            'target_date': _dateStr(workItem.targetDate!),
          if (workItem.parentId != null)
            'parent': workItem.parentId,
          if (workItem.assigneeIds != null)
            'assignees': workItem.assigneeIds,
          if (workItem.labelIds != null)
            'labels': workItem.labelIds,
          if (workItem.estimate != null)
            'estimate_point': workItem.estimate,
        },
      );
      final updated = WorkItemMapper.fromJson(
        {...response.data, 'workspace_slug': workspaceSlug},
      );

      await _workItemDao.insertOne(WorkItemMapper.toCompanion(updated));

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
  }) async {
    try {
      final path = '/api/v1/workspaces/$workspaceSlug'
          '/projects/$projectId'
          '/work-items/$workItemId/';
      await _api.delete<void>(path);
      await _workItemDao.deleteById(workItemId);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureEither<List<WorkItem>> search({
    required String workspaceSlug,
    required String query,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/work-items/search/',
        queryParameters: {'q': query},
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      final items = results
          .cast<Map<String, dynamic>>()
          .map((json) => WorkItemMapper.fromJson(
                {...json, 'workspace_slug': workspaceSlug},
              ))
          .toList();
      return Right(items);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackSearch(query);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackSearch(query);
    }
  }

  @override
  FutureEither<List<WorkItem>> getByFilter({
    required String workspaceSlug,
    required String projectId,
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/work-items/',
        queryParameters: {
          'expand': 'state',
          ...?filters,
        },
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      final items = results
          .cast<Map<String, dynamic>>()
          .map((json) => WorkItemMapper.fromJson(
                {...json, 'workspace_slug': workspaceSlug},
              ))
          .toList();
      return Right(items);
    } on ApiException catch (e) {
      if (e is NetworkException) {
        return _fallbackGetByProject(projectId);
      }
      return Left(ExceptionMapper.mapApiException(e));
    } catch (e) {
      return _fallbackGetByProject(projectId);
    }
  }

  Future<Either<Failure, List<WorkItem>>> _fallbackGetByProject(
    String projectId,
  ) async {
    try {
      final rows = await _workItemDao.getByProject(projectId);
      if (rows.isEmpty) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      final items = await Future.wait(rows.map(_rowToEntity));
      return Right(items);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, WorkItem>> _fallbackGetById(String id) async {
    try {
      final row = await _workItemDao.getById(id);
      if (row == null) {
        return const Left(NetworkFailure('No network and no cached data'));
      }
      return Right(await _rowToEntity(row));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<WorkItem>>> _fallbackSearch(
    String query,
  ) async {
    try {
      final rows = await _workItemDao.search(query);
      final items = await Future.wait(rows.map(_rowToEntity));
      return Right(items);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  Future<WorkItem> _rowToEntity(WorkItemsTableData row) async {
    WorkItemState? state;
    if (row.stateId != null) {
      final stateRow = await _stateDao.getById(row.stateId!);
      if (stateRow != null) {
        state = WorkItemState(
          id: stateRow.id,
          name: stateRow.name,
          group: StateGroup.values[stateRow.groupValue],
          color: stateRow.color ?? '#888888',
          sequence: stateRow.sequence,
          projectId: stateRow.projectId,
        );
      }
    }
    return WorkItemMapper.fromRow(row, state: state);
  }

  static String _dateStr(DateTime dt) =>
      dt.toIso8601String().split('T').first;
}
