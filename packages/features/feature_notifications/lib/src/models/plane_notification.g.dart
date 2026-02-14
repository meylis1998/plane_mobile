// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plane_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaneNotificationImpl _$$PlaneNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$PlaneNotificationImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  workspaceSlug: json['workspaceSlug'] as String,
  message: json['message'] as String? ?? '',
  isRead: json['isRead'] as bool? ?? false,
  entityType: json['entityType'] as String?,
  entityId: json['entityId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  senderName: json['senderName'] as String?,
  senderAvatar: json['senderAvatar'] as String?,
);

Map<String, dynamic> _$$PlaneNotificationImplToJson(
  _$PlaneNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'workspaceSlug': instance.workspaceSlug,
  'message': instance.message,
  'isRead': instance.isRead,
  'entityType': instance.entityType,
  'entityId': instance.entityId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'senderName': instance.senderName,
  'senderAvatar': instance.senderAvatar,
};
