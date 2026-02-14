import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/models/cycle_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_filter_provider.g.dart';

@riverpod
class CycleFilterNotifier extends _$CycleFilterNotifier {
  @override
  CycleFilter build() => const CycleFilter();

  void setStatus(CycleStatus? status) {
    state = CycleFilter(status: status);
  }

  void clear() {
    state = const CycleFilter();
  }
}
