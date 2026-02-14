import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_analytics.freezed.dart';
part 'project_analytics.g.dart';

@freezed
class ProjectAnalytics with _$ProjectAnalytics {
  const factory ProjectAnalytics({
    required int totalIssues,
    required int completedIssues,
    required int openIssues,
    required int overdueIssues,
    required Map<StateGroup, int> issuesByState,
    required Map<Priority, int> issuesByPriority,
    required Map<String, int> issuesByAssignee,
  }) = _ProjectAnalytics;

  factory ProjectAnalytics.fromJson(Map<String, dynamic> json) =>
      _$ProjectAnalyticsFromJson(json);
}
