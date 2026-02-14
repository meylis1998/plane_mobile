import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_item_filter.freezed.dart';
part 'work_item_filter.g.dart';

@freezed
class WorkItemFilter with _$WorkItemFilter {
  const factory WorkItemFilter({
    @Default([]) List<StateGroup> stateGroups,
    @Default([]) List<Priority> priorities,
    @Default([]) List<String> assigneeIds,
    @Default([]) List<String> labelIds,
  }) = _WorkItemFilter;

  const WorkItemFilter._();

  factory WorkItemFilter.fromJson(Map<String, dynamic> json) =>
      _$WorkItemFilterFromJson(json);

  bool get isEmpty =>
      stateGroups.isEmpty &&
      priorities.isEmpty &&
      assigneeIds.isEmpty &&
      labelIds.isEmpty;

  bool get isNotEmpty => !isEmpty;

  int get activeCount =>
      (stateGroups.isNotEmpty ? 1 : 0) +
      (priorities.isNotEmpty ? 1 : 0) +
      (assigneeIds.isNotEmpty ? 1 : 0) +
      (labelIds.isNotEmpty ? 1 : 0);

  Map<String, String> toQueryParameters() {
    final params = <String, String>{};
    if (stateGroups.isNotEmpty) {
      params['state__group'] = stateGroups.map((g) => g.name).join(',');
    }
    if (priorities.isNotEmpty) {
      params['priority'] = priorities.map((p) => p.name).join(',');
    }
    if (assigneeIds.isNotEmpty) {
      params['assignees'] = assigneeIds.join(',');
    }
    if (labelIds.isNotEmpty) {
      params['labels'] = labelIds.join(',');
    }
    return params;
  }
}
