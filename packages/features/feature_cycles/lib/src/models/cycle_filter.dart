import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_filter.freezed.dart';

@freezed
class CycleFilter with _$CycleFilter {
  const factory CycleFilter({
    CycleStatus? status,
  }) = _CycleFilter;

  const CycleFilter._();

  bool get isEmpty => status == null;

  bool get isNotEmpty => !isEmpty;
}
