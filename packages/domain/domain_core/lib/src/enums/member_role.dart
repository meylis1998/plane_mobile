import 'package:json_annotation/json_annotation.dart';

part 'member_role.g.dart';

@JsonEnum(alwaysCreate: true, valueField: 'value')
enum MemberRole {
  admin(20),
  member(15),
  viewer(10),
  guest(5);

  const MemberRole(this.value);

  final int value;
}
