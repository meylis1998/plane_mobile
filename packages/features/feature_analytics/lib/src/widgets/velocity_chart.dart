import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Line chart showing sprint velocity (completed issues) across cycles.
class VelocityChart extends StatelessWidget {
  const VelocityChart({
    this.height = 240,
    super.key,
  });

  final double height;

  /// Sample velocity data for past sprints.
  List<FlSpot> _generateVelocityData() {
    // Simulated velocity across 8 sprints
    const velocities = [18, 22, 20, 26, 24, 28, 30, 28];
    return [
      for (var i = 0; i < velocities.length; i++)
        FlSpot(i.toDouble(), velocities[i].toDouble()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final spots = _generateVelocityData();
    final maxY = spots.map((s) => s.y).fold<double>(0, math.max);

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
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 12),
            child: Row(
              children: [
                _LegendDot(
                  color: PlaneColors.info,
                  label: 'Velocity (issues/sprint)',
                ),
              ],
            ),
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: (spots.length - 1).toDouble(),
                minY: 0,
                maxY: (maxY * 1.2).ceilToDouble(),
                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: math.max<double>(
                    (maxY / 4).ceilToDouble(),
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
                        (maxY / 4).ceilToDouble(),
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
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= spots.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            'S${index + 1}',
                            style: PlaneTypography.labelSmall.copyWith(
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
                    getTooltipColor: (_) =>
                        PlaneColors.grey800.withValues(alpha: 0.9),
                    tooltipRoundedRadius: 8,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          'Sprint ${spot.x.toInt() + 1}: '
                          '${spot.y.toInt()} issues',
                          PlaneTypography.labelSmall.copyWith(
                            color: PlaneColors.white,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    curveSmoothness: 0.25,
                    color: PlaneColors.info,
                    barWidth: 3,
                    dotData: FlDotData(
                      getDotPainter: (spot, percent, bar, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: PlaneColors.white,
                          strokeWidth: 2,
                          strokeColor: PlaneColors.info,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          PlaneColors.info.withValues(alpha: 0.15),
                          PlaneColors.info.withValues(alpha: 0.02),
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
