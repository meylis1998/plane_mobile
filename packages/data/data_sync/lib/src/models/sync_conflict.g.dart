// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_conflict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncConflictImpl _$$SyncConflictImplFromJson(Map<String, dynamic> json) =>
    _$SyncConflictImpl(
      id: json['id'] as String,
      entityType: json['entityType'] as String,
      entityId: json['entityId'] as String,
      localData: json['localData'] as Map<String, dynamic>,
      serverData: json['serverData'] as Map<String, dynamic>,
      detectedAt: DateTime.parse(json['detectedAt'] as String),
    );

Map<String, dynamic> _$$SyncConflictImplToJson(_$SyncConflictImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'localData': instance.localData,
      'serverData': instance.serverData,
      'detectedAt': instance.detectedAt.toIso8601String(),
    };
