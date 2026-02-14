import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/work_item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class CalendarDayDetail extends StatelessWidget {
  const CalendarDayDetail({
    required this.date,
    required this.items,
    this.projectIdentifier,
    this.onItemTap,
    super.key,
  });

  final DateTime date;
  final List<WorkItem> items;
  final String? projectIdentifier;
  final void Function(WorkItem)? onItemTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            '${monthNames[date.month - 1]} ${date.day}, ${date.year}',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Divider(height: 1, color: PlaneColors.dividerLight),
        if (items.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.event_available_rounded,
                    size: 40,
                    color: PlaneColors.grey300,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No items due on this date',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: PlaneColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: PlaneColors.dividerLight),
              itemBuilder: (context, index) {
                final item = items[index];
                return WorkItemListTile(
                  workItem: item,
                  projectIdentifier: projectIdentifier,
                  onTap: () => onItemTap?.call(item),
                );
              },
            ),
          ),
      ],
    );
  }
}
