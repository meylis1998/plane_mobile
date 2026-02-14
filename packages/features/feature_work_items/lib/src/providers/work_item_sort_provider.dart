import 'package:feature_work_items/src/models/work_item_sort.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_sort_provider.g.dart';

@riverpod
class WorkItemSortNotifier extends _$WorkItemSortNotifier {
  @override
  WorkItemSort build() => const WorkItemSort();

  void setField(SortField field) {
    state = state.copyWith(field: field);
  }

  void setDirection(SortDirection direction) {
    state = state.copyWith(direction: direction);
  }

  void toggleDirection() {
    state = state.copyWith(
      direction: state.direction == SortDirection.ascending
          ? SortDirection.descending
          : SortDirection.ascending,
    );
  }

  void reset() {
    state = const WorkItemSort();
  }
}
