import 'package:domain_core/domain_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Donut chart showing issue distribution across state groups.
class IssuesByStateChart extends StatelessWidget {
  const IssuesByStateChart({
    required this.issuesByState,
    this.height = 260,
    super.key,
  });

  final Map<StateGroup, int> issuesByState;
  final double height;

  static const Map<StateGroup, Color> _stateColors = {
    StateGroup.backlog: PlaneColors.stateBacklog,
    StateGroup.unstarted: PlaneColors.stateUnstarted,
    StateGroup.started: PlaneColors.stateStarted,
    StateGroup.completed: PlaneColors.stateCompleted,
    StateGroup.cancelled: PlaneColors.stateCancelled,
  };

  static const Map<StateGroup, String> _stateLabels = {
    StateGroup.backlog: 'Backlog',
    StateGroup.unstarted: 'Unstarted',
    StateGroup.started: 'Started',
    StateGroup.completed: 'Completed',
    StateGroup.cancelled: 'Cancelled',
  };

  @override
  Widget build(BuildContext context) {
    final total = issuesByState.values.fold<int>(0, (a, b) => a + b);

    if (total == 0) {
      return SizedBox(
        height: height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.pie_chart_outline,
                size: 48,
                color: PlaneColors.grey300,
              ),
              const SizedBox(height: 8),
              Text(
                'No issue data available',
                style: PlaneTypography.bodySmall.copyWith(
                  color: PlaneColors.grey400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final sections = <PieChartSectionData>[];
    for (final state in StateGroup.values) {
      final count = issuesByState[state] ?? 0;
      if (count == 0) continue;
      final percentage = count / total * 100;
      sections.add(
        PieChartSectionData(
          value: count.toDouble(),
          color: _stateColors[state] ?? PlaneColors.grey400,
          radius: 32,
          title: '${percentage.round()}%',
          titleStyle: PlaneTypography.labelSmall.copyWith(
            color: PlaneColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return RepaintBoundary(
      child: Container(
        height: height,
        padding: const EdgeInsets.all(PlaneSpacing.md),
        decoration: BoxDecoration(
          color: PlaneColors.grey50,
          borderRadius: PlaneRadius.lg,
          border: Border.all(color: PlaneColors.grey200),
        ),
        child: Column(
          children: [
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: sections,
                  centerSpaceRadius: 44,
                  sectionsSpace: 2,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            const SizedBox(height: PlaneSpacing.sm),
            _Legend(issuesByState: issuesByState, total: total),
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({
    required this.issuesByState,
    required this.total,
  });

  final Map<StateGroup, int> issuesByState;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: PlaneSpacing.md,
      runSpacing: PlaneSpacing.xs,
      children: [
        for (final state in StateGroup.values)
          if ((issuesByState[state] ?? 0) > 0)
            _LegendItem(
              color: IssuesByStateChart._stateColors[state] ??
                  PlaneColors.grey400,
              label: IssuesByStateChart._stateLabels[state] ?? state.name,
              count: issuesByState[state] ?? 0,
            ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.label,
    required this.count,
  });

  final Color color;
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$label ($count)',
          style: PlaneTypography.labelSmall.copyWith(
            color: PlaneColors.grey600,
          ),
        ),
      ],
    );
  }
}
