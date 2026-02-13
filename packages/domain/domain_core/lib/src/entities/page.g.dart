// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageImpl _$$PageImplFromJson(Map<String, dynamic> json) => _$PageImpl(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  name: json['name'] as String,
  access: $enumDecodeNullable(_$PageAccessEnumMap, json['access']),
  content: json['content'] as String?,
  isFavorite: json['isFavorite'] as bool? ?? false,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$PageImplToJson(_$PageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'access': _$PageAccessEnumMap[instance.access],
      'content': instance.content,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$PageAccessEnumMap = {
  PageAccess.public_: 'public',
  PageAccess.private_: 'private',
};
