// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkItemStateImpl _$$WorkItemStateImplFromJson(Map<String, dynamic> json) =>
    _$WorkItemStateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      group: $enumDecode(_$StateGroupEnumMap, json['group']),
      color: json['color'] as String,
      sequence: (json['sequence'] as num).toInt(),
      projectId: json['projectId'] as String,
    );

Map<String, dynamic> _$$WorkItemStateImplToJson(_$WorkItemStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'group': _$StateGroupEnumMap[instance.group]!,
      'color': instance.color,
      'sequence': instance.sequence,
      'projectId': instance.projectId,
    };

const _$StateGroupEnumMap = {
  StateGroup.backlog: 'backlog',
  StateGroup.unstarted: 'unstarted',
  StateGroup.started: 'started',
  StateGroup.completed: 'completed',
  StateGroup.cancelled: 'cancelled',
};
