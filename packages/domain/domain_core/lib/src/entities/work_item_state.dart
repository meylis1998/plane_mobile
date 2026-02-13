import 'package:domain_core/src/enums/state_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_item_state.freezed.dart';
part 'work_item_state.g.dart';

@freezed
class WorkItemState with _$WorkItemState {
  const factory WorkItemState({
    required String id,
    required String name,
    required StateGroup group,
    required String color,
    required int sequence,
    required String projectId,
  }) = _WorkItemState;

  factory WorkItemState.fromJson(Map<String, dynamic> json) =>
      _$WorkItemStateFromJson(json);
}
