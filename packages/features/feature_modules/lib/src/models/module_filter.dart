import 'package:feature_modules/src/models/module_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_filter.freezed.dart';
part 'module_filter.g.dart';

@freezed
class ModuleFilter with _$ModuleFilter {
  const factory ModuleFilter({
    @Default([]) List<ModuleStatus> statuses,
  }) = _ModuleFilter;

  const ModuleFilter._();

  factory ModuleFilter.fromJson(Map<String, dynamic> json) =>
      _$ModuleFilterFromJson(json);

  bool get isEmpty => statuses.isEmpty;

  bool get isNotEmpty => !isEmpty;
}
