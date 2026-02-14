// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burndown_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BurndownPointImpl _$$BurndownPointImplFromJson(Map<String, dynamic> json) =>
    _$BurndownPointImpl(
      date: DateTime.parse(json['date'] as String),
      ideal: (json['ideal'] as num).toDouble(),
      actual: (json['actual'] as num).toDouble(),
    );

Map<String, dynamic> _$$BurndownPointImplToJson(_$BurndownPointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'ideal': instance.ideal,
      'actual': instance.actual,
    };
