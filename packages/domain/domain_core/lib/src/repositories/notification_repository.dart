import 'package:core_foundation/core_foundation.dart';

abstract class NotificationRepository {
  FutureEither<List<Map<String, dynamic>>> getAll({
    required String workspaceSlug,
  });

  FutureVoid markRead({
    required String workspaceSlug,
    required String notificationId,
  });

  FutureVoid markAllRead({required String workspaceSlug});
}
