import 'package:domain_core/src/enums/cycle_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle.freezed.dart';
part 'cycle.g.dart';

@freezed
class Cycle with _$Cycle {
  const factory Cycle({
    required String id,
    required String projectId,
    required String name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    CycleStatus? status,
    int? totalIssues,
    int? completedIssues,
    double? progress,
  }) = _Cycle;

  factory Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);
}
