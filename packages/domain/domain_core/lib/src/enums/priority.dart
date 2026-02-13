import 'package:json_annotation/json_annotation.dart';

part 'priority.g.dart';

@JsonEnum(alwaysCreate: true)
enum Priority {
  @JsonValue('urgent')
  urgent,
  @JsonValue('high')
  high,
  @JsonValue('medium')
  medium,
  @JsonValue('low')
  low,
  @JsonValue('none')
  none,
}
