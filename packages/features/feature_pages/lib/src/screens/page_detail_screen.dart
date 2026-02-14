import 'package:domain_core/domain_core.dart' as domain;
import 'package:feature_pages/src/providers/page_content_provider.dart';
import 'package:feature_pages/src/providers/page_detail_provider.dart';
import 'package:feature_pages/src/providers/page_mutations_provider.dart';
import 'package:feature_pages/src/widgets/page_access_badge.dart';
import 'package:feature_pages/src/widgets/page_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Page detail screen with rich text editor, title editing,
/// access toggle, favorite toggle, and auto-save.
class PageDetailScreen extends ConsumerStatefulWidget {
  const PageDetailScreen({
    required this.workspaceSlug,
    required this.projectId,
    required this.pageId,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final String pageId;

  @override
  ConsumerState<PageDetailScreen> createState() => _PageDetailScreenState();
}

class _PageDetailScreenState extends ConsumerState<PageDetailScreen> {
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final asyncPage = ref.watch(
      pageDetailProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
        pageId: widget.pageId,
      ),
    );
    final asyncContent = ref.watch(
      pageContentProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
        pageId: widget.pageId,
      ),
    );

    return Scaffold(
      appBar: asyncPage.whenOrNull(
        data: _buildAppBar,
      ),
      body: asyncContent.when(
        loading: PlaneLoadingShimmer.detail,
        error: (error, stack) => PlaneErrorWidget(
          message: 'Failed to load page content',
          detail: error.toString(),
          onRetry: () => ref.invalidate(
            pageContentProvider(
              workspaceSlug: widget.workspaceSlug,
              projectId: widget.projectId,
              pageId: widget.pageId,
            ),
          ),
        ),
        data: (content) => PageEditor(
          initialContent: content,
          onContentChanged: _saveContent,
        ),
      ),
    );
  }

  AppBar _buildAppBar(domain.Page page) {
    return AppBar(
      title: GestureDetector(
        onTap: () => _showTitleEditDialog(page),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                page.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.edit_outlined, size: 16),
          ],
        ),
      ),
      actions: [
        // Save indicator
        if (_isSaving)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        // Access toggle
        if (page.access != null)
          IconButton(
            icon: Icon(
              page.access == domain.PageAccess.public_
                  ? Icons.public
                  : Icons.lock_outline,
              size: 20,
            ),
            tooltip: page.access == domain.PageAccess.public_
                ? 'Public - tap to make private'
                : 'Private - tap to make public',
            onPressed: () {
              ref.read(pageMutationsProvider.notifier).toggleAccess(
                    workspaceSlug: widget.workspaceSlug,
                    projectId: widget.projectId,
                    page: page,
                  );
            },
          ),
        // Favorite toggle
        IconButton(
          icon: Icon(
            page.isFavorite ? Icons.star : Icons.star_border,
            color: page.isFavorite ? PlaneColors.warning : null,
            size: 22,
          ),
          onPressed: () {
            ref.read(pageMutationsProvider.notifier).toggleFavorite(
                  workspaceSlug: widget.workspaceSlug,
                  projectId: widget.projectId,
                  page: page,
                );
          },
        ),
        // More menu
        PopupMenuButton<String>(
          onSelected: (action) => _handleMenuAction(action, page),
          itemBuilder: (_) => [
            const PopupMenuItem(
              value: 'rename',
              child: ListTile(
                leading: Icon(Icons.edit_outlined),
                title: Text('Rename'),
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            PopupMenuItem(
              value: 'access',
              child: ListTile(
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
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: PlaneColors.error,
                ),
                title: Text(
                  'Delete',
                  style: TextStyle(color: PlaneColors.error),
                ),
                dense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
      bottom: page.access != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(28),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: PageAccessBadge(access: page.access!),
                ),
              ),
            )
          : null,
    );
  }

  Future<void> _saveContent(String content) async {
    setState(() => _isSaving = true);

    final currentPage = ref
        .read(
          pageDetailProvider(
            workspaceSlug: widget.workspaceSlug,
            projectId: widget.projectId,
            pageId: widget.pageId,
          ),
        )
        .valueOrNull;

    if (currentPage != null) {
      await ref.read(pageMutationsProvider.notifier).updatePage(
            workspaceSlug: widget.workspaceSlug,
            projectId: widget.projectId,
            page: currentPage.copyWith(content: content),
          );
    }

    if (mounted) {
      setState(() => _isSaving = false);
    }
  }

  void _handleMenuAction(String action, domain.Page page) {
    switch (action) {
      case 'rename':
        _showTitleEditDialog(page);
      case 'access':
        ref.read(pageMutationsProvider.notifier).toggleAccess(
              workspaceSlug: widget.workspaceSlug,
              projectId: widget.projectId,
              page: page,
            );
      case 'delete':
        _showDeleteConfirmation(page);
    }
  }

  void _showTitleEditDialog(domain.Page page) {
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
              ref.read(pageMutationsProvider.notifier).deletePage(
                    workspaceSlug: widget.workspaceSlug,
                    projectId: widget.projectId,
                    pageId: page.id,
                  );
              Navigator.pop(ctx);
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
