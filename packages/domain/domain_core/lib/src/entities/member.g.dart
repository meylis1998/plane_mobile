// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  role: $enumDecode(_$MemberRoleEnumMap, json['role']),
  avatar: json['avatar'] as String?,
);

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'displayName': instance.displayName,
      'role': _$MemberRoleEnumMap[instance.role]!,
      'avatar': instance.avatar,
    };

const _$MemberRoleEnumMap = {
  MemberRole.admin: 20,
  MemberRole.member: 15,
  MemberRole.viewer: 10,
  MemberRole.guest: 5,
};
