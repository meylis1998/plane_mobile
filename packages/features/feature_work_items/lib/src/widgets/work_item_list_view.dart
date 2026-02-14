import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/work_item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

class WorkItemListView extends StatefulWidget {
  const WorkItemListView({
    required this.items,
    this.projectIdentifier,
    this.onItemTap,
    this.onStateTap,
    this.onPriorityTap,
    this.onRefresh,
    this.onLoadMore,
    this.isLoading = false,
    super.key,
  });

  final List<WorkItem> items;
  final String? projectIdentifier;
  final void Function(WorkItem)? onItemTap;
  final void Function(WorkItem)? onStateTap;
  final void Function(WorkItem)? onPriorityTap;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onLoadMore;
  final bool isLoading;

  @override
  State<WorkItemListView> createState() => _WorkItemListViewState();
}

class _WorkItemListViewState extends State<WorkItemListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.onLoadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty && !widget.isLoading) {
      return const PlaneEmptyState(
        icon: Icons.inbox_rounded,
        title: 'No work items found',
        message: 'Try adjusting your filters or create a new work item.',
      );
    }

    final child = ListView.separated(
      controller: _scrollController,
      itemCount: widget.items.length + (widget.isLoading ? 1 : 0),
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: PlaneColors.dividerLight),
      itemBuilder: (context, index) {
        if (index == widget.items.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final item = widget.items[index];
        return WorkItemListTile(
          workItem: item,
          projectIdentifier: widget.projectIdentifier,
          onTap: () => widget.onItemTap?.call(item),
          onStateTap: () => widget.onStateTap?.call(item),
          onPriorityTap: () => widget.onPriorityTap?.call(item),
        );
      },
    );

    if (widget.onRefresh != null) {
      return RefreshIndicator(
        onRefresh: widget.onRefresh!,
        child: child,
      );
    }
    return child;
  }
}
