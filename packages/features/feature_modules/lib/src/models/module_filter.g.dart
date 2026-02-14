// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModuleFilterImpl _$$ModuleFilterImplFromJson(Map<String, dynamic> json) =>
    _$ModuleFilterImpl(
      statuses:
          (json['statuses'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ModuleStatusEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ModuleFilterImplToJson(
  _$ModuleFilterImpl instance,
) => <String, dynamic>{
  'statuses': instance.statuses.map((e) => _$ModuleStatusEnumMap[e]!).toList(),
};

const _$ModuleStatusEnumMap = {
  ModuleStatus.backlog: 'backlog',
  ModuleStatus.planned: 'planned',
  ModuleStatus.inProgress: 'inProgress',
  ModuleStatus.paused: 'paused',
  ModuleStatus.completed: 'completed',
  ModuleStatus.cancelled: 'cancelled',
};
