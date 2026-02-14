import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Displays a colored dot/icon for a [StateGroup] value.
class PlaneStateIcon extends StatelessWidget {
  const PlaneStateIcon({
    required this.stateGroup,
    super.key,
    this.size = 14,
    this.color,
  });

  final StateGroup stateGroup;
  final double size;
  final Color? color;

  /// Returns the default color for a given [StateGroup].
  static Color colorFor(StateGroup stateGroup) {
    return switch (stateGroup) {
      StateGroup.backlog => PlaneColors.stateBacklog,
      StateGroup.unstarted => PlaneColors.stateUnstarted,
      StateGroup.started => PlaneColors.stateStarted,
      StateGroup.completed => PlaneColors.stateCompleted,
      StateGroup.cancelled => PlaneColors.stateCancelled,
    };
  }

  /// Returns a display label for a given [StateGroup].
  static String labelFor(StateGroup stateGroup) {
    return switch (stateGroup) {
      StateGroup.backlog => 'Backlog',
      StateGroup.unstarted => 'Unstarted',
      StateGroup.started => 'Started',
      StateGroup.completed => 'Completed',
      StateGroup.cancelled => 'Cancelled',
    };
  }

  @override
  Widget build(BuildContext context) {
    final resolvedColor = color ?? colorFor(stateGroup);

    if (stateGroup == StateGroup.completed) {
      return Icon(
        Icons.check_circle,
        color: resolvedColor,
        size: size,
      );
    }

    if (stateGroup == StateGroup.cancelled) {
      return Icon(
        Icons.cancel,
        color: resolvedColor,
        size: size,
      );
    }

    // For backlog, unstarted, started: colored dot
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: resolvedColor,
          width: stateGroup == StateGroup.started ? size / 4 : 2,
        ),
        color: stateGroup == StateGroup.started
            ? null
            : Colors.transparent,
      ),
    );
  }
}
