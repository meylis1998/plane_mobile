import 'package:json_annotation/json_annotation.dart';

part 'page_access.g.dart';

@JsonEnum(alwaysCreate: true)
enum PageAccess {
  @JsonValue('public')
  public_,
  @JsonValue('private')
  private_,
}
