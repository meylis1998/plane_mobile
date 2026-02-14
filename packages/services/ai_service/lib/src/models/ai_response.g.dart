// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiResponseImpl _$$AiResponseImplFromJson(Map<String, dynamic> json) =>
    _$AiResponseImpl(
      result: json['result'] as String,
      originalText: json['originalText'] as String,
      action: $enumDecode(_$AiActionEnumMap, json['action']),
    );

Map<String, dynamic> _$$AiResponseImplToJson(_$AiResponseImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'originalText': instance.originalText,
      'action': _$AiActionEnumMap[instance.action]!,
    };

const _$AiActionEnumMap = {
  AiAction.improve: 'improve',
  AiAction.grammar: 'grammar',
  AiAction.summarize: 'summarize',
  AiAction.tone: 'tone',
  AiAction.generate: 'generate',
};
