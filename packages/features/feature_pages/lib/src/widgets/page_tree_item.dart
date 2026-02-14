import 'package:feature_pages/src/models/page_tree_node.dart';
import 'package:feature_pages/src/widgets/page_access_badge.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A single page item in the tree view.
/// Shows icon, title, access badge, favorite star, and expand arrow.
class PageTreeItem extends StatelessWidget {
  const PageTreeItem({
    required this.node,
    this.onTap,
    this.onFavoriteTap,
    this.onExpandTap,
    this.onLongPress,
    super.key,
  });

  final PageTreeNode node;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onExpandTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final page = node.page;
    final hasChildren = node.children.isNotEmpty;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0 + (node.depth * 24.0),
          right: 12,
          top: 10,
          bottom: 10,
        ),
        child: Row(
          children: [
            // Expand arrow (only if has children)
            if (hasChildren)
              GestureDetector(
                onTap: onExpandTap,
                child: Icon(
                  node.isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  size: 20,
                  color: PlaneColors.grey500,
                ),
              )
            else
              const SizedBox(width: 20),
            const SizedBox(width: 4),
            // Page icon
            const Icon(
              Icons.article_outlined,
              size: 20,
              color: PlaneColors.grey600,
            ),
            const SizedBox(width: 10),
            // Title
            Expanded(
              child: Text(
                page.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            // Access badge
            if (page.access != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: PageAccessBadge(access: page.access!),
              ),
            // Favorite star
            GestureDetector(
              onTap: onFavoriteTap,
              child: Icon(
                page.isFavorite ? Icons.star : Icons.star_border,
                color: page.isFavorite
                    ? PlaneColors.warning
                    : PlaneColors.grey400,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
