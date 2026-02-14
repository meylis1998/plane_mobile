import 'package:feature_notifications/src/providers/notification_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_count_provider.g.dart';

@riverpod
int unreadCount(
  Ref ref, {
  required String workspaceSlug,
}) {
  final asyncNotifications = ref.watch(
    notificationListProvider(workspaceSlug: workspaceSlug),
  );
  return asyncNotifications.maybeWhen(
    data: (notifications) =>
        notifications.where((n) => !n.isRead).length,
    orElse: () => 0,
  );
}
