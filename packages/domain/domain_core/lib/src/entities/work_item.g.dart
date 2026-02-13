// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkItemImpl _$$WorkItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkItemImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      workspaceSlug: json['workspaceSlug'] as String,
      name: json['name'] as String,
      state: WorkItemState.fromJson(json['state'] as Map<String, dynamic>),
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      description: json['description'] as String?,
      descriptionHtml: json['descriptionHtml'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      targetDate: json['targetDate'] == null
          ? null
          : DateTime.parse(json['targetDate'] as String),
      parentId: json['parentId'] as String?,
      sequenceId: (json['sequenceId'] as num?)?.toInt(),
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      assigneeIds: (json['assigneeIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labelIds: (json['labelIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cycleId: json['cycleId'] as String?,
      moduleId: json['moduleId'] as String?,
      createdById: json['createdById'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      estimate: (json['estimate'] as num?)?.toInt(),
      isDirty: json['isDirty'] as bool? ?? false,
      localVersion: (json['localVersion'] as num?)?.toInt() ?? 0,
      serverVersion: (json['serverVersion'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WorkItemImplToJson(_$WorkItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'workspaceSlug': instance.workspaceSlug,
      'name': instance.name,
      'state': instance.state,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'description': instance.description,
      'descriptionHtml': instance.descriptionHtml,
      'startDate': instance.startDate?.toIso8601String(),
      'targetDate': instance.targetDate?.toIso8601String(),
      'parentId': instance.parentId,
      'sequenceId': instance.sequenceId,
      'sortOrder': instance.sortOrder,
      'assigneeIds': instance.assigneeIds,
      'labelIds': instance.labelIds,
      'cycleId': instance.cycleId,
      'moduleId': instance.moduleId,
      'createdById': instance.createdById,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'estimate': instance.estimate,
      'isDirty': instance.isDirty,
      'localVersion': instance.localVersion,
      'serverVersion': instance.serverVersion,
    };

const _$PriorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.medium: 'medium',
  Priority.low: 'low',
  Priority.none: 'none',
};
