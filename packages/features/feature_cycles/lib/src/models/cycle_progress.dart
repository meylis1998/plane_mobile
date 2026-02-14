import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_progress.freezed.dart';
part 'cycle_progress.g.dart';

@freezed
class CycleProgress with _$CycleProgress {
  const factory CycleProgress({
    required DateTime date,
    required int completed,
    required int total,
  }) = _CycleProgress;

  factory CycleProgress.fromJson(Map<String, dynamic> json) =>
      _$CycleProgressFromJson(json);
}
