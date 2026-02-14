import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Displays a start/end date range with a duration indicator.
class CycleDateRange extends StatelessWidget {
  const CycleDateRange({
    this.startDate,
    this.endDate,
    this.compact = false,
    super.key,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final bool compact;

  static String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  static String _formatDateShort(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  String _duration() {
    if (startDate == null || endDate == null) return '';
    final days = endDate!.difference(startDate!).inDays;
    if (days < 7) return '$days days';
    final weeks = (days / 7).ceil();
    return '$weeks ${weeks == 1 ? 'week' : 'weeks'}';
  }

  @override
  Widget build(BuildContext context) {
    if (startDate == null && endDate == null) {
      return Text(
        'No dates set',
        style: PlaneTypography.bodySmall.copyWith(
          color: PlaneColors.grey400,
        ),
      );
    }

    final startStr = startDate != null
        ? (compact ? _formatDateShort(startDate!) : _formatDate(startDate!))
        : 'Not set';
    final endStr = endDate != null
        ? (compact ? _formatDateShort(endDate!) : _formatDate(endDate!))
        : 'Not set';
    final durationStr = _duration();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.calendar_today,
          size: compact ? 13 : 15,
          color: PlaneColors.grey500,
        ),
        const SizedBox(width: PlaneSpacing.xs),
        Text(
          '$startStr  -  $endStr',
          style: (compact
                  ? PlaneTypography.labelSmall
                  : PlaneTypography.bodySmall)
              .copyWith(color: PlaneColors.grey600),
        ),
        if (durationStr.isNotEmpty) ...[
          const SizedBox(width: PlaneSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: PlaneSpacing.xs + 2,
              vertical: 1,
            ),
            decoration: const BoxDecoration(
              color: PlaneColors.grey100,
              borderRadius: PlaneRadius.sm,
            ),
            child: Text(
              durationStr,
              style: PlaneTypography.labelSmall.copyWith(
                color: PlaneColors.grey500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
