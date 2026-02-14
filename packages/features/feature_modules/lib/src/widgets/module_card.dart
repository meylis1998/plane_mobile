import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/models/module_status.dart';
import 'package:feature_modules/src/widgets/module_date_range.dart';
import 'package:feature_modules/src/widgets/module_progress_bar.dart';
import 'package:feature_modules/src/widgets/module_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Card showing module name, status, dates, and progress bar.
class ModuleCard extends StatelessWidget {
  const ModuleCard({
    required this.module,
    super.key,
    this.onTap,
  });

  final Module module;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final status = ModuleStatus.fromString(module.status);

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
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: PlaneColors.primarySurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.view_module_outlined,
                      size: 20,
                      color: PlaneColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      module.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (status != null) ModuleStatusBadge(status: status),
                ],
              ),
              if (module.description != null &&
                  module.description!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  module.description!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: PlaneColors.grey500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 10),
              ModuleDateRange(
                startDate: module.startDate,
                targetDate: module.targetDate,
              ),
              const SizedBox(height: 8),
              ModuleProgressBar(
                completedIssues: module.completedIssues ?? 0,
                totalIssues: module.totalIssues ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
