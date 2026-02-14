import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class CalendarDayCell extends StatelessWidget {
  const CalendarDayCell({
    required this.date,
    required this.isCurrentMonth,
    this.isToday = false,
    this.isSelected = false,
    this.items = const [],
    this.onTap,
    super.key,
  });

  final DateTime date;
  final bool isCurrentMonth;
  final bool isToday;
  final bool isSelected;
  final List<WorkItem> items;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: isCurrentMonth ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? PlaneColors.primarySurface
              : isToday
                  ? PlaneColors.grey100
                  : null,
          borderRadius: BorderRadius.circular(8),
          border: isToday
              ? Border.all(color: PlaneColors.primary, width: 1.5)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: isCurrentMonth
                    ? (isToday
                        ? PlaneColors.primary
                        : PlaneColors.textPrimaryLight)
                    : PlaneColors.textDisabledLight,
                fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            if (items.isNotEmpty) ...[
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildDots(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    final priorities = items.map((e) => e.priority).toSet().toList();
    final displayCount = priorities.length > 3 ? 3 : priorities.length;
    return List.generate(displayCount, (index) {
      return Container(
        width: 5,
        height: 5,
        margin: const EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _priorityColor(priorities[index]),
        ),
      );
    });
  }

  static Color _priorityColor(Priority priority) {
    return switch (priority) {
      Priority.urgent => PlaneColors.priorityUrgent,
      Priority.high => PlaneColors.priorityHigh,
      Priority.medium => PlaneColors.priorityMedium,
      Priority.low => PlaneColors.priorityLow,
      Priority.none => PlaneColors.priorityNone,
    };
  }
}
