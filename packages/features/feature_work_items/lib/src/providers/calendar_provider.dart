import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_provider.g.dart';

@riverpod
class CalendarNotifier extends _$CalendarNotifier {
  @override
  DateTime build({
    required String workspaceSlug,
    required String projectId,
  }) {
    final now = DateTime.now();
    return DateTime(now.year, now.month);
  }

  void nextMonth() {
    final current = state;
    state = DateTime(current.year, current.month + 1);
  }

  void previousMonth() {
    final current = state;
    state = DateTime(current.year, current.month - 1);
  }

  void goToToday() {
    final now = DateTime.now();
    state = DateTime(now.year, now.month);
  }
}

@riverpod
class SelectedDateNotifier extends _$SelectedDateNotifier {
  @override
  DateTime? build({
    required String workspaceSlug,
    required String projectId,
  }) {
    return null;
  }

  // ignore: use_setters_to_change_properties
  void select(DateTime? date) {
    state = date;
  }
}

@riverpod
Future<Map<DateTime, List<WorkItem>>> workItemsByDate(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  final currentMonth = ref.watch(
    calendarNotifierProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ),
  );
  final items = await ref.watch(
    workItemListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ).future,
  );

  final map = <DateTime, List<WorkItem>>{};
  for (final item in items) {
    if (item.targetDate == null) continue;
    final date = DateTime(
      item.targetDate!.year,
      item.targetDate!.month,
      item.targetDate!.day,
    );
    // Only include items whose target date falls in the current month view
    if (date.year == currentMonth.year && date.month == currentMonth.month) {
      map.putIfAbsent(date, () => []).add(item);
    }
  }

  return map;
}
