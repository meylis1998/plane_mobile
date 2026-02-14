import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/work_item_filter_provider.dart';
import 'package:feature_work_items/src/providers/work_item_sort_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_item_list_provider.g.dart';

/// Provider for the work item repository.
/// Must be overridden at the app level with a concrete implementation.
@Riverpod(keepAlive: true)
class WorkItemRepositoryNotifier extends _$WorkItemRepositoryNotifier {
  @override
  WorkItemRepository build() {
    throw UnimplementedError(
      'workItemRepositoryNotifierProvider must be overridden',
    );
  }
}

@riverpod
class WorkItemList extends _$WorkItemList {
  @override
  Future<List<WorkItem>> build({
    required String workspaceSlug,
    required String projectId,
  }) async {
    final repository = ref.watch(workItemRepositoryNotifierProvider);
    final filter = ref.watch(workItemFilterNotifierProvider);
    final sort = ref.watch(workItemSortNotifierProvider);

    final filters = <String, dynamic>{
      ...filter.toQueryParameters(),
      'order_by': sort.toQueryParameter(),
    };

    final result = await repository.getByFilter(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      filters: filters,
    );

    return result.fold(
      (failure) => throw failure,
      (items) => items,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
