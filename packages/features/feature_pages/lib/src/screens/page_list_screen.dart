import 'package:domain_core/domain_core.dart' as domain;
import 'package:feature_pages/src/models/page_filter.dart';
import 'package:feature_pages/src/models/page_tree_node.dart';
import 'package:feature_pages/src/providers/page_list_provider.dart';
import 'package:feature_pages/src/providers/page_mutations_provider.dart';
import 'package:feature_pages/src/providers/page_search_provider.dart';
import 'package:feature_pages/src/providers/page_tree_provider.dart';
import 'package:feature_pages/src/widgets/page_access_badge.dart';
import 'package:feature_pages/src/widgets/page_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// The main page list screen with tree view, search, filter, and FAB.
class PageListScreen extends ConsumerStatefulWidget {
  const PageListScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onPageTap,
    this.onCreateTap,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final void Function(domain.Page page)? onPageTap;
  final VoidCallback? onCreateTap;

  @override
  ConsumerState<PageListScreen> createState() => _PageListScreenState();
}

class _PageListScreenState extends ConsumerState<PageListScreen> {
  final _searchController = TextEditingController();
  bool _showSearch = false;
  PageFilter _filter = PageFilter.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncTree = ref.watch(
      pageTreeProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
      ),
    );
    final asyncFiltered = ref.watch(
      filteredPagesProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: _showSearch
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search pages...',
                  border: InputBorder.none,
                ),
                onChanged: (query) {
                  ref.read(pageSearchQueryProvider.notifier).update(query);
                },
              )
            : const Text('Pages'),
        actions: [
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  _searchController.clear();
                  ref.read(pageSearchQueryProvider.notifier).clear();
                }
              });
            },
          ),
          PopupMenuButton<PageFilter>(
            icon: const Icon(Icons.filter_list),
            onSelected: (filter) => setState(() => _filter = filter),
            itemBuilder: (_) => [
              _filterItem(PageFilter.all, 'All'),
              _filterItem(PageFilter.favorites, 'Favorites'),
              _filterItem(PageFilter.recent, 'Recent'),
            ],
          ),
        ],
      ),
      body: _showSearch
          ? _buildSearchResults(asyncFiltered)
          : _buildTreeView(asyncTree),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onCreateTap,
        backgroundColor: PlaneColors.primary,
        child: const Icon(Icons.add, color: PlaneColors.white),
      ),
    );
  }

  PopupMenuEntry<PageFilter> _filterItem(PageFilter filter, String label) {
    return PopupMenuItem(
      value: filter,
      child: Row(
        children: [
          if (_filter == filter)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.check, size: 18, color: PlaneColors.primary),
            )
          else
            const SizedBox(width: 26),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildTreeView(AsyncValue<List<PageTreeNode>> asyncTree) {
    return asyncTree.when(
      loading: PlaneLoadingShimmer.pageTree,
      error: (error, stack) => PlaneErrorWidget(
        message: 'Failed to load pages',
        detail: error.toString(),
        onRetry: () => ref
            .read(
              pageListProvider(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
              ).notifier,
            )
            .refresh(),
      ),
      data: (nodes) {
        // Apply filter
        List<PageTreeNode> filteredNodes;
        switch (_filter) {
          case PageFilter.all:
            filteredNodes = nodes;
          case PageFilter.favorites:
            filteredNodes =
                nodes.where((n) => n.page.isFavorite).toList();
          case PageFilter.recent:
            filteredNodes = List<PageTreeNode>.from(nodes)
              ..sort((a, b) {
                final aDate = a.page.updatedAt ?? DateTime(2000);
                final bDate = b.page.updatedAt ?? DateTime(2000);
                return bDate.compareTo(aDate);
              });
        }

        if (filteredNodes.isEmpty) {
          return PlaneEmptyState(
            icon: Icons.article_outlined,
            title: 'No pages yet',
            message: 'Create your first page to get started.',
            actionLabel: 'Create Page',
            onAction: widget.onCreateTap,
          );
        }

        return RefreshIndicator(
          onRefresh: () => ref
              .read(
                pageListProvider(
                  workspaceSlug: widget.workspaceSlug,
                  projectId: widget.projectId,
                ).notifier,
              )
              .refresh(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: PageTreeView(
              nodes: filteredNodes,
              onPageTap: widget.onPageTap,
              onFavoriteTap: (domain.Page page) {
                ref.read(pageMutationsProvider.notifier).toggleFavorite(
                      workspaceSlug: widget.workspaceSlug,
                      projectId: widget.projectId,
                      page: page,
                    );
              },
              onLongPress: (domain.Page page) =>
                  _showContextMenu(context, page),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchResults(AsyncValue<List<domain.Page>> asyncFiltered) {
    return asyncFiltered.when(
      loading: PlaneLoadingShimmer.pageTree,
      error: (error, stack) => PlaneErrorWidget(
        message: 'Search failed',
        detail: error.toString(),
        onRetry: () => ref
            .read(
              pageListProvider(
                workspaceSlug: widget.workspaceSlug,
                projectId: widget.projectId,
              ).notifier,
            )
            .refresh(),
      ),
      data: (pages) {
        if (pages.isEmpty) {
          return const PlaneEmptyState(
            icon: Icons.search_off,
            title: 'No matching pages',
            message: 'Try a different search term.',
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.only(bottom: 80),
          itemCount: pages.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final page = pages[index];
            return ListTile(
              leading: const Icon(
                Icons.article_outlined,
                color: PlaneColors.grey600,
              ),
              title: Text(
                page.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: page.access != null
                  ? PageAccessBadge(access: page.access!)
                  : null,
              trailing: Icon(
                page.isFavorite ? Icons.star : Icons.star_border,
                color: page.isFavorite
                    ? PlaneColors.warning
                    : PlaneColors.grey400,
                size: 20,
              ),
              onTap: () => widget.onPageTap?.call(page),
              onLongPress: () => _showContextMenu(context, page),
            );
          },
        );
      },
    );
  }

  void _showContextMenu(BuildContext context, domain.Page page) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('Rename'),
              onTap: () {
                Navigator.pop(ctx);
                _showRenameDialog(page);
              },
            ),
            ListTile(
              leading: Icon(
                page.access == domain.PageAccess.public_
                    ? Icons.lock_outline
                    : Icons.public,
              ),
              title: Text(
                page.access == domain.PageAccess.public_
                    ? 'Make Private'
                    : 'Make Public',
              ),
              onTap: () {
                Navigator.pop(ctx);
                ref.read(pageMutationsProvider.notifier).toggleAccess(
                      workspaceSlug: widget.workspaceSlug,
                      projectId: widget.projectId,
                      page: page,
                    );
              },
            ),
            ListTile(
              leading: Icon(
                page.isFavorite ? Icons.star_border : Icons.star,
              ),
              title: Text(
                page.isFavorite
                    ? 'Remove from Favorites'
                    : 'Add to Favorites',
              ),
              onTap: () {
                Navigator.pop(ctx);
                ref.read(pageMutationsProvider.notifier).toggleFavorite(
                      workspaceSlug: widget.workspaceSlug,
                      projectId: widget.projectId,
                      page: page,
                    );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.delete_outline,
                color: PlaneColors.error,
              ),
              title: const Text(
                'Delete',
                style: TextStyle(color: PlaneColors.error),
              ),
              onTap: () {
                Navigator.pop(ctx);
                _showDeleteConfirmation(page);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showRenameDialog(domain.Page page) {
    final controller = TextEditingController(text: page.name);
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Rename Page'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Page name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final newName = controller.text.trim();
              if (newName.isNotEmpty && newName != page.name) {
                ref.read(pageMutationsProvider.notifier).updatePage(
                      workspaceSlug: widget.workspaceSlug,
                      projectId: widget.projectId,
                      page: page.copyWith(name: newName),
                    );
              }
              Navigator.pop(ctx);
            },
            child: const Text('Rename'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(domain.Page page) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Page'),
        content: Text(
          'Are you sure you want to delete "${page.name}"? '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: PlaneColors.error,
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              ref.read(pageMutationsProvider.notifier).deletePage(
                    workspaceSlug: widget.workspaceSlug,
                    projectId: widget.projectId,
                    pageId: page.id,
                  );
              Navigator.pop(ctx);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
