// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String,
      workspaceId: json['workspaceId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      identifier: json['identifier'] as String?,
      emoji: json['emoji'] as String?,
      coverImage: json['coverImage'] as String?,
      network: $enumDecodeNullable(_$ProjectNetworkEnumMap, json['network']),
      isArchived: json['isArchived'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      states: (json['states'] as List<dynamic>?)
          ?.map((e) => WorkItemState.fromJson(e as Map<String, dynamic>))
          .toList(),
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workspaceId': instance.workspaceId,
      'name': instance.name,
      'description': instance.description,
      'identifier': instance.identifier,
      'emoji': instance.emoji,
      'coverImage': instance.coverImage,
      'network': _$ProjectNetworkEnumMap[instance.network],
      'isArchived': instance.isArchived,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'states': instance.states,
      'labels': instance.labels,
    };

const _$ProjectNetworkEnumMap = {
  ProjectNetwork.secret: 0,
  ProjectNetwork.private_: 2,
};
