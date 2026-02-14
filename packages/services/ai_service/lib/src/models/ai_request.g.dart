// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiRequestImpl _$$AiRequestImplFromJson(Map<String, dynamic> json) =>
    _$AiRequestImpl(
      text: json['text'] as String,
      action: $enumDecode(_$AiActionEnumMap, json['action']),
      tone: $enumDecodeNullable(_$AiToneEnumMap, json['tone']),
    );

Map<String, dynamic> _$$AiRequestImplToJson(_$AiRequestImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'action': _$AiActionEnumMap[instance.action]!,
      'tone': _$AiToneEnumMap[instance.tone],
    };

const _$AiActionEnumMap = {
  AiAction.improve: 'improve',
  AiAction.grammar: 'grammar',
  AiAction.summarize: 'summarize',
  AiAction.tone: 'tone',
  AiAction.generate: 'generate',
};

const _$AiToneEnumMap = {
  AiTone.professional: 'professional',
  AiTone.casual: 'casual',
  AiTone.friendly: 'friendly',
  AiTone.assertive: 'assertive',
  AiTone.empathetic: 'empathetic',
};
