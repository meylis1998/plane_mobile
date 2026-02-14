import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/models/work_item_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_filter_provider.g.dart';

@riverpod
class WorkItemFilterNotifier extends _$WorkItemFilterNotifier {
  @override
  WorkItemFilter build() => const WorkItemFilter();

  void setStateGroups(List<StateGroup> groups) {
    state = state.copyWith(stateGroups: groups);
  }

  void toggleStateGroup(StateGroup group) {
    final current = List<StateGroup>.from(state.stateGroups);
    if (current.contains(group)) {
      current.remove(group);
    } else {
      current.add(group);
    }
    state = state.copyWith(stateGroups: current);
  }

  void setPriorities(List<Priority> priorities) {
    state = state.copyWith(priorities: priorities);
  }

  void togglePriority(Priority priority) {
    final current = List<Priority>.from(state.priorities);
    if (current.contains(priority)) {
      current.remove(priority);
    } else {
      current.add(priority);
    }
    state = state.copyWith(priorities: current);
  }

  void setAssigneeIds(List<String> ids) {
    state = state.copyWith(assigneeIds: ids);
  }

  void toggleAssigneeId(String id) {
    final current = List<String>.from(state.assigneeIds);
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    state = state.copyWith(assigneeIds: current);
  }

  void setLabelIds(List<String> ids) {
    state = state.copyWith(labelIds: ids);
  }

  void toggleLabelId(String id) {
    final current = List<String>.from(state.labelIds);
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    state = state.copyWith(labelIds: current);
  }

  void clear() {
    state = const WorkItemFilter();
  }
}
