import 'dart:math' as math;

import 'package:domain_core/domain_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Horizontal bar chart showing issue counts grouped by priority level.
class IssuesByPriorityChart extends StatelessWidget {
  const IssuesByPriorityChart({
    required this.issuesByPriority,
    this.height = 240,
    super.key,
  });

  final Map<Priority, int> issuesByPriority;
  final double height;

  static const Map<Priority, Color> _priorityColors = {
    Priority.urgent: PlaneColors.priorityUrgent,
    Priority.high: PlaneColors.priorityHigh,
    Priority.medium: PlaneColors.priorityMedium,
    Priority.low: PlaneColors.priorityLow,
    Priority.none: PlaneColors.priorityNone,
  };

  static const List<Priority> _order = [
    Priority.urgent,
    Priority.high,
    Priority.medium,
    Priority.low,
    Priority.none,
  ];

  static const Map<Priority, String> _labels = {
    Priority.urgent: 'Urgent',
    Priority.high: 'High',
    Priority.medium: 'Medium',
    Priority.low: 'Low',
    Priority.none: 'None',
  };

  @override
  Widget build(BuildContext context) {
    final maxValue = issuesByPriority.values.fold<int>(0, math.max);

    if (maxValue == 0) {
      return SizedBox(
        height: height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.bar_chart,
                size: 48,
                color: PlaneColors.grey300,
              ),
              const SizedBox(height: 8),
              Text(
                'No priority data available',
                style: PlaneTypography.bodySmall.copyWith(
                  color: PlaneColors.grey400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final barGroups = <BarChartGroupData>[];
    for (var i = 0; i < _order.length; i++) {
      final priority = _order[i];
      final count = issuesByPriority[priority] ?? 0;
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: count.toDouble(),
              width: 20,
              color: _priorityColors[priority] ?? PlaneColors.grey400,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ],
        ),
      );
    }

    return RepaintBoundary(
      child: Container(
        height: height,
        padding: const EdgeInsets.only(
          left: PlaneSpacing.sm,
          right: PlaneSpacing.md,
          top: PlaneSpacing.md,
          bottom: PlaneSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: PlaneColors.grey50,
          borderRadius: PlaneRadius.lg,
          border: Border.all(color: PlaneColors.grey200),
        ),
        child: BarChart(
        BarChartData(
          maxY: (maxValue * 1.2).ceilToDouble(),
          barGroups: barGroups,
          gridData: FlGridData(
            drawVerticalLine: false,
            horizontalInterval: math.max<double>(
              (maxValue / 4).ceilToDouble(),
              1,
            ),
            getDrawingHorizontalLine: (value) => const FlLine(
              color: PlaneColors.grey200,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(color: PlaneColors.grey300),
              left: BorderSide(color: PlaneColors.grey300),
            ),
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                interval: math.max<double>(
                  (maxValue / 4).ceilToDouble(),
                  1,
                ),
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      value.toInt().toString(),
                      style: PlaneTypography.labelSmall.copyWith(
                        color: PlaneColors.grey400,
                      ),
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= _order.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      _labels[_order[index]] ?? '',
                      style: PlaneTypography.labelSmall.copyWith(
                        color: PlaneColors.grey500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) =>
                  PlaneColors.grey800.withValues(alpha: 0.9),
              tooltipRoundedRadius: 8,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final priority = _order[group.x];
                return BarTooltipItem(
                  '${_labels[priority]}: ${rod.toY.toInt()}',
                  PlaneTypography.labelSmall.copyWith(
                    color: PlaneColors.white,
                  ),
                );
              },
            ),
          ),
        ),
      ),
      ),
    );
  }
}
