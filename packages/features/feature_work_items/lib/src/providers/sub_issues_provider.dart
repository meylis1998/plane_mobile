import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_issues_provider.g.dart';

@riverpod
class SubIssues extends _$SubIssues {
  @override
  Future<List<WorkItem>> build({
    required String workspaceSlug,
    required String projectId,
    required String parentId,
  }) async {
    final allItems = await ref.watch(
      workItemListProvider(
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ).future,
    );
    return allItems.where((item) => item.parentId == parentId).toList();
  }
}
