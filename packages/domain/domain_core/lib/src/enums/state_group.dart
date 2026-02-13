import 'package:json_annotation/json_annotation.dart';

part 'state_group.g.dart';

@JsonEnum(alwaysCreate: true)
enum StateGroup {
  @JsonValue('backlog')
  backlog,
  @JsonValue('unstarted')
  unstarted,
  @JsonValue('started')
  started,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}
