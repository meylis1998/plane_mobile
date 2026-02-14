import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:data_sync/src/handlers/entity_sync_handler.dart';

/// Syncs projects to the Plane API.
class ProjectSyncHandler extends EntitySyncHandler {
  ProjectSyncHandler({required PlaneApiClient apiClient})
      : _api = apiClient;

  final PlaneApiClient _api;

  @override
  String get entityType => 'project';

  @override
  FutureVoid syncCreate(Map<String, dynamic> payload) async {
    try {
      final slug = payload['workspaceSlug'] as String;
      await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$slug/projects/',
        data: payload['data'],
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }

  @override
  FutureVoid syncUpdate(Map<String, dynamic> payload) async {
    try {
      final slug = payload['workspaceSlug'] as String;
      final projectId = payload['entityId'] as String;
      await _api.patch<Map<String, dynamic>>(
        '/api/v1/workspaces/$slug/projects/$projectId/',
        data: payload['data'],
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }

  @override
  FutureVoid syncDelete(Map<String, dynamic> payload) async {
    try {
      final slug = payload['workspaceSlug'] as String;
      final projectId = payload['entityId'] as String;
      await _api.delete<Map<String, dynamic>>(
        '/api/v1/workspaces/$slug/projects/$projectId/',
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }
}
