import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/project_states_provider.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_kanban_provider.g.dart';

@riverpod
class WorkItemKanban extends _$WorkItemKanban {
  @override
  Future<Map<String, List<WorkItem>>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final items = await ref.watch(
      workItemListProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ).future,
    );
    final states = await ref.watch(
      projectStatesNotifierProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ).future,
    );

    final grouped = <String, List<WorkItem>>{};
    for (final s in states) {
      grouped[s.id] = items
          .where((item) => item.state.id == s.id)
          .toList()
        ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    }

    return grouped;
  }

  Future<void> moveItem({
    required String itemId,
    required String fromStateId,
    required String toStateId,
    required int newIndex,
  }) async {
    final current = state.valueOrNull;
    if (current == null) return;

    // Find the item
    final fromList = current[fromStateId];
    if (fromList == null) return;
    final itemIndex = fromList.indexWhere((item) => item.id == itemId);
    if (itemIndex == -1) return;
    final item = fromList[itemIndex];

    // Find the target state
    final states = await ref.read(
      projectStatesNotifierProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ).future,
    );
    final targetState = states.firstWhere((s) => s.id == toStateId);

    // Optimistic update
    final updated = Map<String, List<WorkItem>>.from(current);
    final updatedFrom = List<WorkItem>.from(fromList)..removeAt(itemIndex);
    updated[fromStateId] = updatedFrom;

    final toList = List<WorkItem>.from(current[toStateId] ?? []);
    final movedItem = item.copyWith(state: targetState);
    final insertIdx = newIndex.clamp(0, toList.length);
    toList.insert(insertIdx, movedItem);
    updated[toStateId] = toList;

    state = AsyncData(updated);

    // API call
    final repository = ref.read(workItemRepositoryNotifierProvider);
    final result = await repository.update(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItem: movedItem,
    );

    // Rollback on error
    result.fold(
      (failure) {
        state = AsyncData(current);
      },
      (_) {
        // Invalidate list to resync
        ref.invalidate(
          workItemListProvider(
            workspaceSlug: workspaceSlug,
            projectId: projectId,
          ),
        );
      },
    );
  }
}
