import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:domain_core/domain_core.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl({required PlaneApiClient apiClient})
      : _api = apiClient;

  final PlaneApiClient _api;

  @override
  FutureEither<List<Map<String, dynamic>>> getAll({
    required String workspaceSlug,
  }) async {
    try {
      final response = await _api.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/users/notifications/',
      );
      final results = (response.data['results'] as List<dynamic>?) ??
          <dynamic>[];
      return Right(results.cast<Map<String, dynamic>>());
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureVoid markRead({
    required String workspaceSlug,
    required String notificationId,
  }) async {
    try {
      await _api.post<void>(
        '/api/v1/workspaces/$workspaceSlug/users/notifications/$notificationId/read/',
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }

  @override
  FutureVoid markAllRead({required String workspaceSlug}) async {
    try {
      await _api.post<void>(
        '/api/v1/workspaces/$workspaceSlug/users/notifications/read/',
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ExceptionMapper.mapApiException(e));
    }
  }
}
