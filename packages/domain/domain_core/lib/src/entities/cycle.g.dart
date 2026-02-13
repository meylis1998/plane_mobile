// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CycleImpl _$$CycleImplFromJson(Map<String, dynamic> json) => _$CycleImpl(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  status: $enumDecodeNullable(_$CycleStatusEnumMap, json['status']),
  totalIssues: (json['totalIssues'] as num?)?.toInt(),
  completedIssues: (json['completedIssues'] as num?)?.toInt(),
  progress: (json['progress'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$CycleImplToJson(_$CycleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'status': _$CycleStatusEnumMap[instance.status],
      'totalIssues': instance.totalIssues,
      'completedIssues': instance.completedIssues,
      'progress': instance.progress,
    };

const _$CycleStatusEnumMap = {
  CycleStatus.current: 'current',
  CycleStatus.upcoming: 'upcoming',
  CycleStatus.completed: 'completed',
  CycleStatus.draft: 'draft',
};
