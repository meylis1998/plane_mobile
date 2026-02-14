import 'package:domain_core/domain_core.dart';
import 'package:feature_pages/src/models/page_tree_node.dart';
import 'package:feature_pages/src/providers/page_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_tree_provider.g.dart';

/// Builds a hierarchical tree from the flat page list.
///
/// Currently the [Page] entity does not have a parentId field,
/// so all pages are treated as root-level nodes. When parentId
/// is added to the entity the tree-building logic will group
/// child pages under their parent.
@riverpod
Future<List<PageTreeNode>> pageTree(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
}) async {
  final pages = await ref.watch(
    pageListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    ).future,
  );

  return _buildTree(pages);
}

List<PageTreeNode> _buildTree(List<Page> pages) {
  // Sort by name for consistent ordering
  final sorted = List<Page>.from(pages)
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  return sorted
      .map(
        (page) => PageTreeNode(page: page),
      )
      .toList();
}
