import 'package:feature_modules/src/models/module_filter.dart';
import 'package:feature_modules/src/models/module_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module_filter_provider.g.dart';

@riverpod
class ModuleFilterNotifier extends _$ModuleFilterNotifier {
  @override
  ModuleFilter build() => const ModuleFilter();

  void setStatuses(List<ModuleStatus> statuses) {
    state = state.copyWith(statuses: statuses);
  }

  void toggleStatus(ModuleStatus status) {
    final current = List<ModuleStatus>.from(state.statuses);
    if (current.contains(status)) {
      current.remove(status);
    } else {
      current.add(status);
    }
    state = state.copyWith(statuses: current);
  }

  void clear() {
    state = const ModuleFilter();
  }
}
