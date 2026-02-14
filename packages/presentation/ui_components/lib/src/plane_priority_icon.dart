import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Displays an icon with color corresponding to a [Priority] value.
class PlanePriorityIcon extends StatelessWidget {
  const PlanePriorityIcon({
    required this.priority,
    super.key,
    this.size = 18,
  });

  final Priority priority;
  final double size;

  /// Returns the color for a given [Priority].
  static Color colorFor(Priority priority) {
    return switch (priority) {
      Priority.urgent => PlaneColors.priorityUrgent,
      Priority.high => PlaneColors.priorityHigh,
      Priority.medium => PlaneColors.priorityMedium,
      Priority.low => PlaneColors.priorityLow,
      Priority.none => PlaneColors.priorityNone,
    };
  }

  /// Returns the icon for a given [Priority].
  static IconData iconFor(Priority priority) {
    return switch (priority) {
      Priority.urgent => PlaneIcons.priorityUrgent,
      Priority.high => PlaneIcons.priorityHigh,
      Priority.medium => PlaneIcons.priorityMedium,
      Priority.low => PlaneIcons.priorityLow,
      Priority.none => PlaneIcons.priorityNone,
    };
  }

  /// Returns the display label for a given [Priority].
  static String labelFor(Priority priority) {
    return switch (priority) {
      Priority.urgent => 'Urgent',
      Priority.high => 'High',
      Priority.medium => 'Medium',
      Priority.low => 'Low',
      Priority.none => 'None',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconFor(priority),
      color: colorFor(priority),
      size: size,
    );
  }
}
