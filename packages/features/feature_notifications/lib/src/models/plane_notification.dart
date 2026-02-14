import 'package:freezed_annotation/freezed_annotation.dart';

part 'plane_notification.freezed.dart';
part 'plane_notification.g.dart';

@freezed
class PlaneNotification with _$PlaneNotification {
  const factory PlaneNotification({
    required String id,
    required String title,
    required String workspaceSlug,
    @Default('') String message,
    @Default(false) bool isRead,
    String? entityType,
    String? entityId,
    DateTime? createdAt,
    String? senderName,
    String? senderAvatar,
  }) = _PlaneNotification;

  factory PlaneNotification.fromJson(Map<String, dynamic> json) =>
      _$PlaneNotificationFromJson(json);
}
