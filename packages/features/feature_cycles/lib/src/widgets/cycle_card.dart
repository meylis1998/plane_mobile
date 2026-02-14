import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/widgets/cycle_date_range.dart';
import 'package:feature_cycles/src/widgets/cycle_progress_bar.dart';
import 'package:feature_cycles/src/widgets/cycle_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A card widget that displays a cycle summary in a list.
class CycleCard extends StatelessWidget {
  const CycleCard({
    required this.cycle,
    this.onTap,
    super.key,
  });

  final Cycle cycle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: PlaneColors.grey200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: PlaneColors.primarySurface,
                      borderRadius: PlaneRadius.sm,
                    ),
                    child: const Icon(
                      Icons.cyclone,
                      size: 18,
                      color: PlaneColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      cycle.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (cycle.status != null)
                    CycleStatusBadge(status: cycle.status!),
                ],
              ),
              const SizedBox(height: 10),
              CycleDateRange(
                startDate: cycle.startDate,
                endDate: cycle.endDate,
                compact: true,
              ),
              const SizedBox(height: 10),
              CycleProgressBar(
                completed: cycle.completedIssues ?? 0,
                total: cycle.totalIssues ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
