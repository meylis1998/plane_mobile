import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/providers/cycle_filter_provider.dart';
import 'package:feature_cycles/src/providers/cycle_list_provider.dart';
import 'package:feature_cycles/src/providers/filtered_cycles_provider.dart';
import 'package:feature_cycles/src/widgets/cycle_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// The main cycle list screen. Displays cycles grouped by status
/// (Active, Upcoming, Completed, Draft), with a filter bar and FAB to create.
class CycleListScreen extends ConsumerWidget {
  const CycleListScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onCycleTap,
    this.onCreateTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final void Function(Cycle cycle)? onCycleTap;
  final VoidCallback? onCreateTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCycles = ref.watch(
      filteredCyclesProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
    final filter = ref.watch(cycleFilterNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cycles')),
      body: Column(
        children: [
          _CycleFilterBar(
            selectedStatus: filter.status,
            onStatusSelected: (status) {
              ref.read(cycleFilterNotifierProvider.notifier).setStatus(status);
            },
          ),
          Expanded(
            child: asyncCycles.when(
              loading: PlaneLoadingShimmer.cardList,
              error: (error, stack) => PlaneErrorWidget(
                message: 'Failed to load cycles',
                detail: error.toString(),
                onRetry: () => ref
                    .read(
                      cycleListProvider(
                        workspaceSlug: workspaceSlug,
                        projectId: projectId,
                      ).notifier,
                    )
                    .refresh(),
              ),
              data: (cycles) {
                if (cycles.isEmpty) {
                  return PlaneEmptyState(
                    icon: Icons.cyclone,
                    title: filter.isNotEmpty
                        ? 'No matching cycles'
                        : 'No cycles yet',
                    message: filter.isNotEmpty
                        ? null
                        : 'Create your first cycle to start planning.',
                    actionLabel: filter.isEmpty ? 'Create Cycle' : null,
                    onAction: filter.isEmpty ? onCreateTap : null,
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref
                      .read(
                        cycleListProvider(
                          workspaceSlug: workspaceSlug,
                          projectId: projectId,
                        ).notifier,
                      )
                      .refresh(),
                  child: _GroupedCycleList(
                    cycles: cycles,
                    hasFilter: filter.isNotEmpty,
                    onCycleTap: onCycleTap,
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
        child: const Icon(Icons.add, color: PlaneColors.white),
      ),
    );
  }
}

class _CycleFilterBar extends StatelessWidget {
  const _CycleFilterBar({
    this.selectedStatus,
    this.onStatusSelected,
  });

  final CycleStatus? selectedStatus;
  final void Function(CycleStatus?)? onStatusSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: PlaneSpacing.md,
        vertical: PlaneSpacing.sm,
      ),
      child: Row(
        children: [
          PlaneChip(
            label: 'All',
            isSelected: selectedStatus == null,
            onTap: () => onStatusSelected?.call(null),
          ),
          const SizedBox(width: PlaneSpacing.sm),
          ...CycleStatus.values.map((status) {
            return Padding(
              padding: const EdgeInsets.only(right: PlaneSpacing.sm),
              child: PlaneChip(
                label: _statusLabel(status),
                isSelected: selectedStatus == status,
                color: _statusColor(status),
                onTap: () => onStatusSelected?.call(status),
              ),
            );
          }),
        ],
      ),
    );
  }

  static String _statusLabel(CycleStatus status) {
    return switch (status) {
      CycleStatus.current => 'Active',
      CycleStatus.upcoming => 'Upcoming',
      CycleStatus.completed => 'Completed',
      CycleStatus.draft => 'Draft',
    };
  }

  static Color _statusColor(CycleStatus status) {
    return switch (status) {
      CycleStatus.current => PlaneColors.success,
      CycleStatus.upcoming => PlaneColors.info,
      CycleStatus.completed => PlaneColors.grey500,
      CycleStatus.draft => PlaneColors.warning,
    };
  }
}

class _GroupedCycleList extends StatelessWidget {
  const _GroupedCycleList({
    required this.cycles,
    required this.hasFilter,
    this.onCycleTap,
  });

  final List<Cycle> cycles;
  final bool hasFilter;
  final void Function(Cycle)? onCycleTap;

  @override
  Widget build(BuildContext context) {
    if (hasFilter) {
      return ListView.builder(
        padding: const EdgeInsets.only(top: 4, bottom: 80),
        itemCount: cycles.length,
        itemBuilder: (context, index) => CycleCard(
          cycle: cycles[index],
          onTap: () => onCycleTap?.call(cycles[index]),
        ),
      );
    }

    final active =
        cycles.where((c) => c.status == CycleStatus.current).toList();
    final upcoming =
        cycles.where((c) => c.status == CycleStatus.upcoming).toList();
    final completed =
        cycles.where((c) => c.status == CycleStatus.completed).toList();
    final draft =
        cycles.where((c) => c.status == CycleStatus.draft).toList();
    final other = cycles
        .where((c) => c.status == null)
        .toList();

    return ListView(
      padding: const EdgeInsets.only(top: 4, bottom: 80),
      children: [
        if (active.isNotEmpty) ...[
          const PlaneSectionHeader(title: 'Active'),
          ...active.map(
            (c) => CycleCard(
              cycle: c,
              onTap: () => onCycleTap?.call(c),
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (upcoming.isNotEmpty) ...[
          const PlaneSectionHeader(title: 'Upcoming'),
          ...upcoming.map(
            (c) => CycleCard(
              cycle: c,
              onTap: () => onCycleTap?.call(c),
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (completed.isNotEmpty) ...[
          const PlaneSectionHeader(title: 'Completed'),
          ...completed.map(
            (c) => CycleCard(
              cycle: c,
              onTap: () => onCycleTap?.call(c),
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (draft.isNotEmpty) ...[
          const PlaneSectionHeader(title: 'Draft'),
          ...draft.map(
            (c) => CycleCard(
              cycle: c,
              onTap: () => onCycleTap?.call(c),
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (other.isNotEmpty) ...[
          const PlaneSectionHeader(title: 'Other'),
          ...other.map(
            (c) => CycleCard(
              cycle: c,
              onTap: () => onCycleTap?.call(c),
            ),
          ),
        ],
      ],
    );
  }
}
