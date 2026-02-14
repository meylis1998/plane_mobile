// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkItemFilterImpl _$$WorkItemFilterImplFromJson(Map<String, dynamic> json) =>
    _$WorkItemFilterImpl(
      stateGroups:
          (json['stateGroups'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$StateGroupEnumMap, e))
              .toList() ??
          const [],
      priorities:
          (json['priorities'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$PriorityEnumMap, e))
              .toList() ??
          const [],
      assigneeIds:
          (json['assigneeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      labelIds:
          (json['labelIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WorkItemFilterImplToJson(
  _$WorkItemFilterImpl instance,
) => <String, dynamic>{
  'stateGroups': instance.stateGroups
      .map((e) => _$StateGroupEnumMap[e]!)
      .toList(),
  'priorities': instance.priorities.map((e) => _$PriorityEnumMap[e]!).toList(),
  'assigneeIds': instance.assigneeIds,
  'labelIds': instance.labelIds,
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
