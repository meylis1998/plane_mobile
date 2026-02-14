import 'dart:math' as math;

import 'package:feature_cycles/src/models/cycle_progress.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A polished line chart showing ideal vs. actual burndown over a cycle.
class BurndownChart extends StatelessWidget {
  const BurndownChart({
    required this.dataPoints,
    required this.totalIssues,
    required this.startDate,
    required this.endDate,
    this.height = 240,
    super.key,
  });

  final List<CycleProgress> dataPoints;
  final int totalIssues;
  final DateTime startDate;
  final DateTime endDate;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (dataPoints.isEmpty || totalIssues == 0) {
      return SizedBox(
        height: height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.show_chart,
                size: 48,
                color: PlaneColors.grey300,
              ),
              const SizedBox(height: 8),
              Text(
                'No burndown data available',
                style: PlaneTypography.bodySmall.copyWith(
                  color: PlaneColors.grey400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final totalDays = endDate.difference(startDate).inDays;
    final maxX = math.max<double>(totalDays.toDouble(), 1);
    final maxY = totalIssues.toDouble();

    // Ideal line: straight line from totalIssues down to 0
    final idealSpots = <FlSpot>[
      FlSpot(0, maxY),
      FlSpot(maxX, 0),
    ];

    // Actual line: remaining issues at each data point
    final actualSpots = <FlSpot>[];
    for (final dp in dataPoints) {
      final dayIndex =
          dp.date.difference(startDate).inDays.toDouble();
      final remaining =
          (dp.total - dp.completed).clamp(0, totalIssues);
      actualSpots.add(FlSpot(dayIndex, remaining.toDouble()));
    }

    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Legend
          const Padding(
            padding: EdgeInsets.only(
              left: 8,
              bottom: 12,
            ),
            child: Row(
              children: [
                _LegendDot(
                  color: PlaneColors.grey400,
                  label: 'Ideal',
                ),
                SizedBox(width: PlaneSpacing.md),
                _LegendDot(
                  color: PlaneColors.primary,
                  label: 'Actual',
                ),
              ],
            ),
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: maxX,
                minY: 0,
                maxY: maxY,
                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: math.max<double>(
                    (maxY / 4).ceilToDouble(),
                    1,
                  ),
                  getDrawingHorizontalLine: (value) =>
                      const FlLine(
                    color: PlaneColors.grey200,
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(
                  border: const Border(
                    bottom: BorderSide(
                      color: PlaneColors.grey300,
                    ),
                    left: BorderSide(
                      color: PlaneColors.grey300,
                    ),
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
                        (maxY / 4).ceilToDouble(),
                        1,
                      ),
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 6,
                          ),
                          child: Text(
                            value.toInt().toString(),
                            style: PlaneTypography.labelSmall
                                .copyWith(
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
                      interval: math.max<double>(
                        (maxX / 5).ceilToDouble(),
                        1,
                      ),
                      getTitlesWidget: (value, meta) {
                        final day = startDate.add(
                          Duration(days: value.toInt()),
                        );
                        const months = [
                          'Jan', 'Feb', 'Mar', //
                          'Apr', 'May', 'Jun',
                          'Jul', 'Aug', 'Sep',
                          'Oct', 'Nov', 'Dec',
                        ];
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                          ),
                          child: Text(
                            '${months[day.month - 1]}'
                            ' ${day.day}',
                            style: PlaneTypography.labelSmall
                                .copyWith(
                              color: PlaneColors.grey400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (_) => PlaneColors.grey800
                        .withValues(alpha: 0.9),
                    tooltipRoundedRadius: 8,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final label = spot.barIndex == 0
                            ? 'Ideal'
                            : 'Remaining';
                        return LineTooltipItem(
                          '$label: ${spot.y.toInt()}',
                          PlaneTypography.labelSmall
                              .copyWith(
                            color: PlaneColors.white,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                lineBarsData: [
                  // Ideal line (dashed, grey)
                  LineChartBarData(
                    spots: idealSpots,
                    color: PlaneColors.grey400,
                    dashArray: [6, 4],
                    dotData: const FlDotData(show: false),
                  ),
                  // Actual line (solid, primary blue,
                  // with gradient area)
                  LineChartBarData(
                    spots: actualSpots,
                    isCurved: true,
                    curveSmoothness: 0.25,
                    color: PlaneColors.primary,
                    barWidth: 3,
                    dotData: FlDotData(
                      getDotPainter:
                          (spot, percent, bar, index) {
                        return FlDotCirclePainter(
                          radius: 3,
                          color: PlaneColors.white,
                          strokeWidth: 2,
                          strokeColor: PlaneColors.primary,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          PlaneColors.primary
                              .withValues(alpha: 0.15),
                          PlaneColors.primary
                              .withValues(alpha: 0.02),
                        ],
                      ),
                    ),
                  ),
                ],
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
