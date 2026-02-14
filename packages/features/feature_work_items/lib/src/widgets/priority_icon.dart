import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class PriorityIcon extends StatelessWidget {
  const PriorityIcon({
    required this.priority,
    this.size = 16,
    super.key,
  });

  final Priority priority;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      _iconData,
      color: _color,
      size: size,
    );
  }

  IconData get _iconData {
    return switch (priority) {
      Priority.urgent => Icons.error_rounded,
      Priority.high => Icons.signal_cellular_alt_rounded,
      Priority.medium => Icons.signal_cellular_alt_2_bar_rounded,
      Priority.low => Icons.signal_cellular_alt_1_bar_rounded,
      Priority.none => Icons.remove_rounded,
    };
  }

  Color get _color {
    return switch (priority) {
      Priority.urgent => PlaneColors.priorityUrgent,
      Priority.high => PlaneColors.priorityHigh,
      Priority.medium => PlaneColors.priorityMedium,
      Priority.low => PlaneColors.priorityLow,
      Priority.none => PlaneColors.priorityNone,
    };
  }

  static String label(Priority priority) {
    return switch (priority) {
      Priority.urgent => 'Urgent',
      Priority.high => 'High',
      Priority.medium => 'Medium',
      Priority.low => 'Low',
      Priority.none => 'None',
    };
  }
}
