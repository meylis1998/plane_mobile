import 'package:freezed_annotation/freezed_annotation.dart';

part 'burndown_point.freezed.dart';
part 'burndown_point.g.dart';

@freezed
class BurndownPoint with _$BurndownPoint {
  const factory BurndownPoint({
    required DateTime date,
    required double ideal,
    required double actual,
  }) = _BurndownPoint;

  factory BurndownPoint.fromJson(Map<String, dynamic> json) =>
      _$BurndownPointFromJson(json);
}
