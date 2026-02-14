// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CycleProgressImpl _$$CycleProgressImplFromJson(Map<String, dynamic> json) =>
    _$CycleProgressImpl(
      date: DateTime.parse(json['date'] as String),
      completed: (json['completed'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$CycleProgressImplToJson(_$CycleProgressImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'completed': instance.completed,
      'total': instance.total,
    };
