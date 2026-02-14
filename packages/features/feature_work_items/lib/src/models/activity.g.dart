// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      id: json['id'] as String,
      workItemId: json['workItemId'] as String,
      projectId: json['projectId'] as String,
      workspaceSlug: json['workspaceSlug'] as String,
      actorId: json['actorId'] as String,
      field: json['field'] as String?,
      oldValue: json['oldValue'] as String?,
      newValue: json['newValue'] as String?,
      verb: json['verb'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workItemId': instance.workItemId,
      'projectId': instance.projectId,
      'workspaceSlug': instance.workspaceSlug,
      'actorId': instance.actorId,
      'field': instance.field,
      'oldValue': instance.oldValue,
      'newValue': instance.newValue,
      'verb': instance.verb,
      'comment': instance.comment,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
