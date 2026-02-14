import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Line chart showing a completion trend over the past N days.
class CompletionTrendChart extends StatelessWidget {
  const CompletionTrendChart({
    this.height = 240,
    super.key,
  });

  final double height;

  /// Generate sample 30-day completion trend data.
  List<FlSpot> _generateTrendData() {
    final spots = <FlSpot>[];
    var cumulative = 0;
    final rng = math.Random(42);
    for (var i = 0; i < 30; i++) {
      cumulative += rng.nextInt(5) + 1;
      spots.add(FlSpot(i.toDouble(), cumulative.toDouble()));
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    final spots = _generateTrendData();
    final maxY = spots.last.y;

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
                  color: PlaneColors.success,
                  label: 'Completed issues',
                ),
              ],
            ),
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 29,
                minY: 0,
                maxY: (maxY * 1.1).ceilToDouble(),
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
                      interval: 7,
                      getTitlesWidget: (value, meta) {
                        final dayLabel = 'Day ${value.toInt() + 1}';
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            dayLabel,
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
                          'Day ${spot.x.toInt() + 1}: '
                          '${spot.y.toInt()} completed',
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
                    color: PlaneColors.success,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          PlaneColors.success.withValues(alpha: 0.15),
                          PlaneColors.success.withValues(alpha: 0.02),
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
