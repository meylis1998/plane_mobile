import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Displays a list of work items assigned to a cycle with state and priority
/// icons.
class CycleIssueList extends StatelessWidget {
  const CycleIssueList({
    required this.issues,
    this.onItemTap,
    super.key,
  });

  final List<WorkItem> issues;
  final void Function(WorkItem)? onItemTap;

  @override
  Widget build(BuildContext context) {
    if (issues.isEmpty) {
      return const PlaneEmptyState(
        icon: Icons.assignment_outlined,
        title: 'No issues in this cycle',
        message: 'Add issues to track progress.',
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: issues.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        color: PlaneColors.dividerLight,
      ),
      itemBuilder: (context, index) {
        final issue = issues[index];
        return InkWell(
          onTap: () => onItemTap?.call(issue),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                PlaneStateIcon(
                  stateGroup: issue.state.group,
                  color: _stateColor(issue.state.group),
                ),
                const SizedBox(width: 10),
                PlanePriorityIcon(priority: issue.priority),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    issue.name,
                    style: PlaneTypography.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (issue.assigneeIds != null &&
                    issue.assigneeIds!.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: PlaneColors.grey200,
                    child: Text(
                      '${issue.assigneeIds!.length}',
                      style: PlaneTypography.labelSmall,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static Color _stateColor(StateGroup group) {
    return switch (group) {
      StateGroup.backlog => PlaneColors.stateBacklog,
      StateGroup.unstarted => PlaneColors.stateUnstarted,
      StateGroup.started => PlaneColors.stateStarted,
      StateGroup.completed => PlaneColors.stateCompleted,
      StateGroup.cancelled => PlaneColors.stateCancelled,
    };
  }
}
