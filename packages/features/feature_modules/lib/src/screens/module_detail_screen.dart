import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/models/module_status.dart';
import 'package:feature_modules/src/providers/module_detail_provider.dart';
import 'package:feature_modules/src/providers/module_mutations_provider.dart';
import 'package:feature_modules/src/widgets/module_date_range.dart';
import 'package:feature_modules/src/widgets/module_issue_list.dart';
import 'package:feature_modules/src/widgets/module_progress_bar.dart';
import 'package:feature_modules/src/widgets/module_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Module detail screen showing header, progress, issues, and actions.
class ModuleDetailScreen extends ConsumerWidget {
  const ModuleDetailScreen({
    required this.workspaceSlug,
    required this.projectId,
    required this.moduleId,
    this.onEditTap,
    this.onIssueTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final String moduleId;
  final VoidCallback? onEditTap;
  final void Function(WorkItem item)? onIssueTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncModule = ref.watch(
      moduleDetailProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        moduleId: moduleId,
      ),
    );

    return Scaffold(
      body: asyncModule.when(
        loading: PlaneLoadingShimmer.detail,
        error: (error, _) => PlaneErrorWidget(
          message: 'Failed to load module',
          onRetry: () => ref.invalidate(
            moduleDetailProvider(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
              moduleId: moduleId,
            ),
          ),
        ),
        data: (module) => _ModuleDetailBody(
          module: module,
          workspaceSlug: workspaceSlug,
          projectId: projectId,
          onEditTap: onEditTap,
          onIssueTap: onIssueTap,
          onDelete: () => _handleDelete(context, ref, module),
        ),
      ),
    );
  }

  Future<void> _handleDelete(
    BuildContext context,
    WidgetRef ref,
    Module module,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Module'),
        content: Text(
          'Are you sure you want to delete "${module.name}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: PlaneColors.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if ((confirmed ?? false) && context.mounted) {
      await ref.read(moduleMutationsProvider.notifier).deleteModule(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
            moduleId: module.id,
          );
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}

class _ModuleDetailBody extends StatelessWidget {
  const _ModuleDetailBody({
    required this.module,
    required this.workspaceSlug,
    required this.projectId,
    this.onEditTap,
    this.onIssueTap,
    this.onDelete,
  });

  final Module module;
  final String workspaceSlug;
  final String projectId;
  final VoidCallback? onEditTap;
  final void Function(WorkItem item)? onIssueTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final status = ModuleStatus.fromString(module.status);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text(
            module.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEditTap,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onDelete,
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(PlaneSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status badge
                if (status != null) ...[
                  ModuleStatusBadge(status: status),
                  const SizedBox(height: PlaneSpacing.md),
                ],

                // Description
                if (module.description != null &&
                    module.description!.isNotEmpty) ...[
                  Text(
                    module.description!,
                    style: PlaneTypography.bodyMedium.copyWith(
                      color: PlaneColors.grey600,
                    ),
                  ),
                  const SizedBox(height: PlaneSpacing.md),
                ],

                // Date range
                ModuleDateRange(
                  startDate: module.startDate,
                  targetDate: module.targetDate,
                ),
                const SizedBox(height: PlaneSpacing.md),

                // Progress section
                const PlaneSectionHeader(title: 'Progress'),
                const SizedBox(height: PlaneSpacing.sm),
                ModuleProgressBar(
                  completedIssues: module.completedIssues ?? 0,
                  totalIssues: module.totalIssues ?? 0,
                ),

                const SizedBox(height: PlaneSpacing.lg),
                const Divider(),
                const SizedBox(height: PlaneSpacing.sm),

                // Issues section
                const PlaneSectionHeader(title: 'Issues'),
                const SizedBox(height: PlaneSpacing.sm),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PlaneSpacing.md),
            child: ModuleIssueList(
              workspaceSlug: workspaceSlug,
              projectId: projectId,
              moduleId: module.id,
              onIssueTap: onIssueTap,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 80),
        ),
      ],
    );
  }
}
