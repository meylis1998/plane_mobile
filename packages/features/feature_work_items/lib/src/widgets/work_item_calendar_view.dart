import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/calendar_provider.dart';
import 'package:feature_work_items/src/widgets/calendar_day_cell.dart';
import 'package:feature_work_items/src/widgets/calendar_day_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

class WorkItemCalendarView extends ConsumerWidget {
  const WorkItemCalendarView({
    required this.workspaceSlug,
    required this.projectId,
    this.projectIdentifier,
    this.onItemTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final String? projectIdentifier;
  final void Function(WorkItem)? onItemTap;

  static const _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMonth = ref.watch(
      calendarNotifierProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    final selectedDate = ref.watch(
      selectedDateNotifierProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    final itemsByDateAsync = ref.watch(
      workItemsByDateProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );

    return Column(
      children: [
        _buildHeader(context, ref, currentMonth),
        _buildWeekDayHeaders(context),
        itemsByDateAsync.when(
          data: (itemsByDate) => _buildCalendarGrid(
            context,
            ref,
            currentMonth,
            selectedDate,
            itemsByDate,
          ),
          loading: () => Expanded(
            child: PlaneLoadingShimmer.calendar(),
          ),
          error: (error, _) => Expanded(
            child: PlaneErrorWidget(
              message: 'Failed to load calendar',
              detail: error.toString(),
            ),
          ),
        ),
        if (selectedDate != null)
          Expanded(
            child: itemsByDateAsync.when(
              data: (itemsByDate) {
                final dateKey = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                );
                final items = itemsByDate[dateKey] ?? [];
                return CalendarDayDetail(
                  date: selectedDate,
                  items: items,
                  projectIdentifier: projectIdentifier,
                  onItemTap: onItemTap,
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Error: $error')),
            ),
          ),
      ],
    );
  }

  Widget _buildHeader(
    BuildContext context,
    WidgetRef ref,
    DateTime currentMonth,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            onPressed: () {
              ref
                  .read(
                    calendarNotifierProvider(
                      workspaceSlug: workspaceSlug,
                      projectId: projectId,
                    ).notifier,
                  )
                  .previousMonth();
            },
          ),
          GestureDetector(
            onTap: () {
              ref
                  .read(
                    calendarNotifierProvider(
                      workspaceSlug: workspaceSlug,
                      projectId: projectId,
                    ).notifier,
                  )
                  .goToToday();
            },
            child: Text(
              '${_monthNames[currentMonth.month - 1]} ${currentMonth.year}',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: () {
              ref
                  .read(
                    calendarNotifierProvider(
                      workspaceSlug: workspaceSlug,
                      projectId: projectId,
                    ).notifier,
                  )
                  .nextMonth();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDayHeaders(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: _weekDays
            .map(
              (day) => Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: PlaneColors.textSecondaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildCalendarGrid(
    BuildContext context,
    WidgetRef ref,
    DateTime currentMonth,
    DateTime? selectedDate,
    Map<DateTime, List<WorkItem>> itemsByDate,
  ) {
    final days = _generateCalendarDays(currentMonth);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final rowCount = (days.length / 7).ceil();

    final grid = Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        shrinkWrap: selectedDate != null,
        physics: selectedDate != null
            ? const NeverScrollableScrollPhysics()
            : null,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: rowCount * 7,
        itemBuilder: (context, index) {
          if (index >= days.length) {
            return const SizedBox.shrink();
          }
          final date = days[index];
          final isCurrentMonth = date.month == currentMonth.month &&
              date.year == currentMonth.year;
          final dateKey = DateTime(date.year, date.month, date.day);
          final isToday = dateKey == today;
          final isSelected = selectedDate != null &&
              dateKey ==
                  DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                  );

          return CalendarDayCell(
            date: date,
            isCurrentMonth: isCurrentMonth,
            isToday: isToday,
            isSelected: isSelected,
            items: itemsByDate[dateKey] ?? [],
            onTap: () {
              ref
                  .read(
                    selectedDateNotifierProvider(
                      workspaceSlug: workspaceSlug,
                      projectId: projectId,
                    ).notifier,
                  )
                  .select(isSelected ? null : date);
            },
          );
        },
      ),
    );

    if (selectedDate != null) {
      return grid;
    }
    return Expanded(child: grid);
  }

  /// Generates all dates visible in the calendar grid for the given month,
  /// including leading days from the previous month and trailing days from
  /// the next month to fill complete weeks (Mon-Sun).
  List<DateTime> _generateCalendarDays(DateTime month) {
    final firstOfMonth = DateTime(month.year, month.month);
    final lastOfMonth = DateTime(month.year, month.month + 1, 0);

    // Monday = 1, Sunday = 7
    final startWeekday = firstOfMonth.weekday;
    final leadingDays = startWeekday - 1; // days before Monday

    final days = <DateTime>[];

    // Leading days from previous month
    for (var i = leadingDays; i > 0; i--) {
      days.add(firstOfMonth.subtract(Duration(days: i)));
    }

    // Current month days
    for (var i = 0; i < lastOfMonth.day; i++) {
      days.add(DateTime(month.year, month.month, i + 1));
    }

    // Trailing days to fill last week
    final remaining = 7 - (days.length % 7);
    if (remaining < 7) {
      for (var i = 1; i <= remaining; i++) {
        days.add(DateTime(month.year, month.month + 1, i));
      }
    }

    return days;
  }
}
