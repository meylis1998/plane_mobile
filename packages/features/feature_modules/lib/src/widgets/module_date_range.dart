import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theme/theme.dart';

/// Displays start and target dates for a module.
class ModuleDateRange extends StatelessWidget {
  const ModuleDateRange({
    super.key,
    this.startDate,
    this.targetDate,
  });

  final DateTime? startDate;
  final DateTime? targetDate;

  static final DateFormat _dateFormat = DateFormat('MMM d, y');

  @override
  Widget build(BuildContext context) {
    if (startDate == null && targetDate == null) {
      return Text(
        'No dates set',
        style: PlaneTypography.bodySmall.copyWith(
          color: PlaneColors.grey400,
        ),
      );
    }

    final start = startDate != null ? _dateFormat.format(startDate!) : '--';
    final target = targetDate != null ? _dateFormat.format(targetDate!) : '--';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 14,
          color: PlaneColors.grey500,
        ),
        const SizedBox(width: PlaneSpacing.xs),
        Text(
          '$start  -  $target',
          style: PlaneTypography.bodySmall.copyWith(
            color: PlaneColors.grey600,
          ),
        ),
      ],
    );
  }
}
