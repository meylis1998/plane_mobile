import 'package:json_annotation/json_annotation.dart';

part 'cycle_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum CycleStatus {
  @JsonValue('current')
  current,
  @JsonValue('upcoming')
  upcoming,
  @JsonValue('completed')
  completed,
  @JsonValue('draft')
  draft,
}
