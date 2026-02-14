// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectAnalyticsImpl _$$ProjectAnalyticsImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectAnalyticsImpl(
  totalIssues: (json['totalIssues'] as num).toInt(),
  completedIssues: (json['completedIssues'] as num).toInt(),
  openIssues: (json['openIssues'] as num).toInt(),
  overdueIssues: (json['overdueIssues'] as num).toInt(),
  issuesByState: (json['issuesByState'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$StateGroupEnumMap, k), (e as num).toInt()),
  ),
  issuesByPriority: (json['issuesByPriority'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$PriorityEnumMap, k), (e as num).toInt()),
  ),
  issuesByAssignee: Map<String, int>.from(json['issuesByAssignee'] as Map),
);

Map<String, dynamic> _$$ProjectAnalyticsImplToJson(
  _$ProjectAnalyticsImpl instance,
) => <String, dynamic>{
  'totalIssues': instance.totalIssues,
  'completedIssues': instance.completedIssues,
  'openIssues': instance.openIssues,
  'overdueIssues': instance.overdueIssues,
  'issuesByState': instance.issuesByState.map(
    (k, e) => MapEntry(_$StateGroupEnumMap[k]!, e),
  ),
  'issuesByPriority': instance.issuesByPriority.map(
    (k, e) => MapEntry(_$PriorityEnumMap[k]!, e),
  ),
  'issuesByAssignee': instance.issuesByAssignee,
};

const _$StateGroupEnumMap = {
  StateGroup.backlog: 'backlog',
  StateGroup.unstarted: 'unstarted',
  StateGroup.started: 'started',
  StateGroup.completed: 'completed',
  StateGroup.cancelled: 'cancelled',
};

const _$PriorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.medium: 'medium',
  Priority.low: 'low',
  Priority.none: 'none',
};
