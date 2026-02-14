import 'package:domain_core/domain_core.dart' as domain;
import 'package:feature_pages/src/models/page_tree_node.dart';
import 'package:feature_pages/src/widgets/page_tree_item.dart';
import 'package:flutter/material.dart';

/// Expandable tree view of pages with indentation levels.
class PageTreeView extends StatefulWidget {
  const PageTreeView({
    required this.nodes,
    this.onPageTap,
    this.onFavoriteTap,
    this.onLongPress,
    super.key,
  });

  final List<PageTreeNode> nodes;
  final void Function(domain.Page page)? onPageTap;
  final void Function(domain.Page page)? onFavoriteTap;
  final void Function(domain.Page page)? onLongPress;

  @override
  State<PageTreeView> createState() => _PageTreeViewState();
}

class _PageTreeViewState extends State<PageTreeView> {
  final Set<String> _expandedIds = {};

  @override
  Widget build(BuildContext context) {
    final flatList = _flatten(widget.nodes);

    if (flatList.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: flatList.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final node = flatList[index];
        return PageTreeItem(
          node: node.copyWith(
            isExpanded: _expandedIds.contains(node.page.id),
          ),
          onTap: () => widget.onPageTap?.call(node.page),
          onFavoriteTap: () => widget.onFavoriteTap?.call(node.page),
          onLongPress: () => widget.onLongPress?.call(node.page),
          onExpandTap: node.children.isNotEmpty
              ? () {
                  setState(() {
                    if (_expandedIds.contains(node.page.id)) {
                      _expandedIds.remove(node.page.id);
                    } else {
                      _expandedIds.add(node.page.id);
                    }
                  });
                }
              : null,
        );
      },
    );
  }

  /// Flattens the tree into a list, respecting expanded state.
  List<PageTreeNode> _flatten(List<PageTreeNode> nodes) {
    final result = <PageTreeNode>[];
    for (final node in nodes) {
      result.add(node);
      if (_expandedIds.contains(node.page.id) && node.children.isNotEmpty) {
        result.addAll(_flatten(node.children));
      }
    }
    return result;
  }
}
