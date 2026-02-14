import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/providers/module_issues_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// List of work items assigned to a module.
class ModuleIssueList extends ConsumerWidget {
  const ModuleIssueList({
    required this.workspaceSlug,
    required this.projectId,
    required this.moduleId,
    super.key,
    this.onIssueTap,
  });

  final String workspaceSlug;
  final String projectId;
  final String moduleId;
  final void Function(WorkItem item)? onIssueTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIssues = ref.watch(
      moduleIssuesProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        moduleId: moduleId,
      ),
    );

    return asyncIssues.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(PlaneSpacing.lg),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => PlaneErrorWidget(
        message: 'Failed to load issues',
        onRetry: () => ref.invalidate(
          moduleIssuesProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
            moduleId: moduleId,
          ),
        ),
      ),
      data: (issues) {
        if (issues.isEmpty) {
          return const PlaneEmptyState(
            title: 'No issues',
            message: 'No work items are assigned to this module yet.',
            icon: Icons.assignment_outlined,
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: issues.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = issues[index];
            return ListTile(
              dense: true,
              title: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: PlaneTypography.bodyMedium,
              ),
              leading: Icon(
                Icons.circle,
                size: 10,
                color: _priorityColor(item.priority),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                size: 18,
                color: PlaneColors.grey400,
              ),
              onTap: () => onIssueTap?.call(item),
            );
          },
        );
      },
    );
  }

  Color _priorityColor(Priority priority) => switch (priority) {
        Priority.urgent => PlaneColors.priorityUrgent,
        Priority.high => PlaneColors.priorityHigh,
        Priority.medium => PlaneColors.priorityMedium,
        Priority.low => PlaneColors.priorityLow,
        Priority.none => PlaneColors.priorityNone,
      };
}
