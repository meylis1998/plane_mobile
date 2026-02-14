import 'package:core_foundation/core_foundation.dart';
import 'package:feature_notifications/src/models/plane_notification.dart';
import 'package:feature_notifications/src/providers/notification_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_list_provider.g.dart';

@riverpod
class NotificationList extends _$NotificationList {
  @override
  Future<List<PlaneNotification>> build({
    required String workspaceSlug,
  }) async {
    final repository = ref.watch(notificationRepositoryProvider);
    final result = await repository.getAll(workspaceSlug: workspaceSlug);
    return result.fold(
      (Failure failure) => throw Exception(failure.message),
      (List<Map<String, dynamic>> data) =>
          data.map(_mapNotification).toList(),
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    ref.invalidateSelf();
  }

  static PlaneNotification _mapNotification(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;
    final issueActivity =
        data?['issue_activity'] as Map<String, dynamic>?;
    final triggeredByDetails =
        json['triggered_by_details'] as Map<String, dynamic>?;

    return PlaneNotification(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ??
          json['entity_name']?.toString() ??
          '',
      message: json['message']?.toString() ??
          issueActivity?['verb']?.toString() ??
          '',
      isRead: json['read_at'] != null,
      entityType: json['entity_name']?.toString(),
      entityId: json['entity_identifier']?.toString(),
      workspaceSlug: json['workspace']?.toString() ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
      senderName: triggeredByDetails?['display_name']?.toString(),
      senderAvatar: triggeredByDetails?['avatar']?.toString(),
    );
  }
}
