import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class StateDot extends StatelessWidget {
  const StateDot({
    required this.state,
    this.size = 12,
    super.key,
  });

  final WorkItemState state;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = parseColor(state.color);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  static Color parseColor(String hex) {
    final cleaned = hex.replaceFirst('#', '');
    if (cleaned.length == 6) {
      return Color(int.parse('FF$cleaned', radix: 16));
    }
    return PlaneColors.grey400;
  }

  static Color colorForGroup(StateGroup group) {
    return switch (group) {
      StateGroup.backlog => PlaneColors.stateBacklog,
      StateGroup.unstarted => PlaneColors.stateUnstarted,
      StateGroup.started => PlaneColors.stateStarted,
      StateGroup.completed => PlaneColors.stateCompleted,
      StateGroup.cancelled => PlaneColors.stateCancelled,
    };
  }
}
