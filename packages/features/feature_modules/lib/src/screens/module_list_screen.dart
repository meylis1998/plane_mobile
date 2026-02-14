import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/models/module_status.dart';
import 'package:feature_modules/src/providers/filtered_modules_provider.dart';
import 'package:feature_modules/src/providers/module_filter_provider.dart';
import 'package:feature_modules/src/providers/module_list_provider.dart';
import 'package:feature_modules/src/widgets/module_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// List of modules with status filter, FAB to create, and pull-to-refresh.
class ModuleListScreen extends ConsumerWidget {
  const ModuleListScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onModuleTap,
    this.onCreateTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final void Function(Module module)? onModuleTap;
  final VoidCallback? onCreateTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncModules = ref.watch(
      filteredModulesProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    final filter = ref.watch(moduleFilterNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modules'),
      ),
      body: Column(
        children: [
          _StatusFilterBar(
            selectedStatuses: filter.statuses,
            onToggle: (status) {
              ref
                  .read(moduleFilterNotifierProvider.notifier)
                  .toggleStatus(status);
            },
          ),
          Expanded(
            child: asyncModules.when(
              loading: PlaneLoadingShimmer.cardList,
              error: (error, _) => PlaneErrorWidget(
                message: 'Failed to load modules',
                onRetry: () => ref
                    .read(
                      moduleListProvider(
                        workspaceSlug: workspaceSlug,
                        projectId: projectId,
                      ).notifier,
                    )
                    .refresh(),
              ),
              data: (modules) {
                if (modules.isEmpty) {
                  return PlaneEmptyState(
                    title: filter.isNotEmpty
                        ? 'No matching modules'
                        : 'No modules yet',
                    message: filter.isNotEmpty
                        ? null
                        : 'Create your first module to group related issues.',
                    icon: Icons.view_module_outlined,
                    actionLabel: filter.isEmpty ? 'Create Module' : null,
                    onAction: filter.isEmpty ? onCreateTap : null,
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref
                      .read(
                        moduleListProvider(
                          workspaceSlug: workspaceSlug,
                          projectId: projectId,
                        ).notifier,
                      )
                      .refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, bottom: 80),
                    itemCount: modules.length,
                    itemBuilder: (context, index) {
                      final module = modules[index];
                      return ModuleCard(
                        module: module,
                        onTap: () => onModuleTap?.call(module),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTap,
        backgroundColor: PlaneColors.primary,
        child: const Icon(
          Icons.add,
          color: PlaneColors.white,
        ),
      ),
    );
  }
}

class _StatusFilterBar extends StatelessWidget {
  const _StatusFilterBar({
    required this.selectedStatuses,
    required this.onToggle,
  });

  final List<ModuleStatus> selectedStatuses;
  final void Function(ModuleStatus) onToggle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: PlaneSpacing.md,
          vertical: PlaneSpacing.sm,
        ),
        itemCount: ModuleStatus.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: PlaneSpacing.sm),
        itemBuilder: (context, index) {
          final status = ModuleStatus.values[index];
          final isSelected = selectedStatuses.contains(status);
          return PlaneChip(
            label: status.label,
            icon: status.icon,
            color: status.color,
            isSelected: isSelected,
            onTap: () => onToggle(status),
          );
        },
      ),
    );
  }
}
