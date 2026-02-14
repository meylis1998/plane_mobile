import 'package:feature_notifications/src/providers/notification_list_provider.dart';
import 'package:feature_notifications/src/providers/notification_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_mutations_provider.g.dart';

@riverpod
class NotificationMutations extends _$NotificationMutations {
  @override
  Object? build() => null;

  /// Marks a single notification as read.
  Future<bool> markRead({
    required String workspaceSlug,
    required String notificationId,
  }) async {
    final repository = ref.read(notificationRepositoryProvider);
    final result = await repository.markRead(
      workspaceSlug: workspaceSlug,
      notificationId: notificationId,
    );

    return result.fold(
      (_) => false,
      (_) {
        ref.invalidate(
          notificationListProvider(workspaceSlug: workspaceSlug),
        );
        return true;
      },
    );
  }

  /// Marks all notifications as read for the given workspace.
  Future<bool> markAllRead({required String workspaceSlug}) async {
    final repository = ref.read(notificationRepositoryProvider);
    final result = await repository.markAllRead(
      workspaceSlug: workspaceSlug,
    );

    return result.fold(
      (_) => false,
      (_) {
        ref.invalidate(
          notificationListProvider(workspaceSlug: workspaceSlug),
        );
        return true;
      },
    );
  }
}
