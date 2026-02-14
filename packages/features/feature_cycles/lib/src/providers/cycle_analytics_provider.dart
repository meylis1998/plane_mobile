import 'package:feature_cycles/src/models/cycle_progress.dart';
import 'package:feature_cycles/src/providers/cycle_detail_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cycle_analytics_provider.g.dart';

/// Provides burndown chart data for a cycle.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates sample data from the cycle's start/end dates
/// and total/completed issues.
@riverpod
Future<List<CycleProgress>> cycleAnalytics(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String cycleId,
}) async {
  final cycle = await ref.watch(
    cycleDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      cycleId: cycleId,
    ).future,
  );

  final startDate = cycle.startDate;
  final endDate = cycle.endDate;
  final total = cycle.totalIssues ?? 0;
  final completed = cycle.completedIssues ?? 0;

  if (startDate == null || endDate == null || total == 0) {
    return [];
  }

  final totalDays = endDate.difference(startDate).inDays;
  if (totalDays <= 0) return [];

  final now = DateTime.now();
  final elapsedDays = now.difference(startDate).inDays.clamp(0, totalDays);

  final dataPoints = <CycleProgress>[];
  for (var i = 0; i <= elapsedDays; i++) {
    final date = startDate.add(Duration(days: i));
    // Simulate a realistic burndown: remaining issues decrease
    // proportionally to the completed ratio, with some variance
    final progress = elapsedDays > 0 ? i / elapsedDays : 0.0;
    final estimatedCompleted = (completed * progress).round();
    dataPoints.add(
      CycleProgress(
        date: date,
        completed: estimatedCompleted,
        total: total,
      ),
    );
  }

  return dataPoints;
}
