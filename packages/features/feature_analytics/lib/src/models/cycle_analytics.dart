import 'package:domain_core/domain_core.dart';
import 'package:feature_analytics/src/models/burndown_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_analytics.freezed.dart';
part 'cycle_analytics.g.dart';

@freezed
class CycleAnalytics with _$CycleAnalytics {
  const factory CycleAnalytics({
    required double velocity,
    required double completionRate,
    required List<BurndownPoint> burndownData,
    required Map<StateGroup, int> issuesByState,
  }) = _CycleAnalytics;

  factory CycleAnalytics.fromJson(Map<String, dynamic> json) =>
      _$CycleAnalyticsFromJson(json);
}
