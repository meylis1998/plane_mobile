import 'dart:math' as math;

import 'package:feature_analytics/src/models/workload_item.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Horizontal bar chart showing assigned vs completed counts per team member.
class WorkloadBarChart extends StatelessWidget {
  const WorkloadBarChart({
    required this.items,
    this.height,
    super.key,
  });

  final List<WorkloadItem> items;

  /// If null, height is computed based on the number of items.
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.people_outline,
                size: 48,
                color: PlaneColors.grey300,
              ),
              const SizedBox(height: 8),
              Text(
                'No workload data available',
                style: PlaneTypography.bodySmall.copyWith(
                  color: PlaneColors.grey400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final maxValue = items
        .map((e) => e.assignedCount)
        .fold<int>(0, math.max);
    final chartHeight = height ?? (items.length * 52.0 + 60);

    final barGroups = <BarChartGroupData>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: item.assignedCount.toDouble(),
              width: 14,
              color: PlaneColors.primary.withValues(alpha: 0.7),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
            BarChartRodData(
              toY: item.completedCount.toDouble(),
              width: 14,
              color: PlaneColors.success,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: chartHeight,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Legend
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 12),
            child: Row(
              children: [
                _LegendDot(
                  color: PlaneColors.primary,
                  label: 'Assigned',
                ),
                SizedBox(width: PlaneSpacing.md),
                _LegendDot(
                  color: PlaneColors.success,
                  label: 'Completed',
                ),
              ],
            ),
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: (maxValue * 1.2).ceilToDouble(),
                barGroups: barGroups,
                groupsSpace: 16,
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
                      reservedSize: 36,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= items.length) {
                          return const SizedBox.shrink();
                        }
                        // Show first name only to save space
                        final name = items[index].memberName.split(' ').first;
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            name,
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
                      final item = items[group.x];
                      final label =
                          rodIndex == 0 ? 'Assigned' : 'Completed';
                      return BarTooltipItem(
                        '${item.memberName}\n$label: ${rod.toY.toInt()}',
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
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({
    required this.color,
    required this.label,
  });

  final Color color;
  final String label;

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
          label,
          style: PlaneTypography.labelSmall.copyWith(
            color: PlaneColors.grey500,
          ),
        ),
      ],
    );
  }
}
