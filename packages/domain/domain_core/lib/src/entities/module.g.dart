// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModuleImpl _$$ModuleImplFromJson(Map<String, dynamic> json) => _$ModuleImpl(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  status: json['status'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  targetDate: json['targetDate'] == null
      ? null
      : DateTime.parse(json['targetDate'] as String),
  totalIssues: (json['totalIssues'] as num?)?.toInt(),
  completedIssues: (json['completedIssues'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ModuleImplToJson(_$ModuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'startDate': instance.startDate?.toIso8601String(),
      'targetDate': instance.targetDate?.toIso8601String(),
      'totalIssues': instance.totalIssues,
      'completedIssues': instance.completedIssues,
    };
