import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:data_sync/src/handlers/entity_sync_handler.dart';

/// Syncs modules to the Plane API.
class ModuleSyncHandler extends EntitySyncHandler {
  ModuleSyncHandler({required PlaneApiClient apiClient})
      : _api = apiClient;

  final PlaneApiClient _api;

  @override
  String get entityType => 'module';

  @override
  FutureVoid syncCreate(Map<String, dynamic> payload) async {
    try {
      final slug = payload['workspaceSlug'] as String;
      final projectId = payload['projectId'] as String;
      await _api.post<Map<String, dynamic>>(
        '/api/v1/workspaces/$slug/projects/$projectId/modules/',
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
      final projectId = payload['projectId'] as String;
      final moduleId = payload['entityId'] as String;
      await _api.patch<Map<String, dynamic>>(
        '/api/v1/workspaces/$slug/projects/$projectId/modules/$moduleId/',
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
      final projectId = payload['projectId'] as String;
      final moduleId = payload['entityId'] as String;
      await _api.delete<Map<String, dynamic>>(
        '/api/v1/workspaces/$slug/projects/$projectId/modules/$moduleId/',
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }
}
