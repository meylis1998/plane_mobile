import 'package:feature_work_items/src/models/view_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_mode_provider.g.dart';

@riverpod
class ViewModeNotifier extends _$ViewModeNotifier {
  @override
  ViewMode build() => ViewMode.list;

  void setViewMode(ViewMode mode) {
    state = mode;
  }

  void toggle() {
    state = switch (state) {
      ViewMode.list => ViewMode.kanban,
      ViewMode.kanban => ViewMode.calendar,
      ViewMode.calendar => ViewMode.list,
    };
  }
}
