import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A generic paginated list view that handles initial loading, pull-to-refresh,
/// infinite scroll (load more), empty state, and error state.
///
/// Use this widget wherever a cursor-based paginated list is needed.
class PaginatedListView<T> extends StatefulWidget {
  const PaginatedListView({
    required this.items,
    required this.itemBuilder,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = false,
    this.hasError = false,
    this.errorMessage,
    this.onRefresh,
    this.onLoadMore,
    this.onRetry,
    this.emptyIcon = Icons.inbox_rounded,
    this.emptyTitle = 'No items found',
    this.emptyMessage,
    this.separatorBuilder,
    this.padding,
    this.loadMoreThreshold = 200.0,
    super.key,
  });

  /// The current list of loaded items.
  final List<T> items;

  /// Builder for each item in the list.
  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  /// Whether the initial data is still loading.
  final bool isLoading;

  /// Whether additional data is being fetched (infinite scroll).
  final bool isLoadingMore;

  /// Whether there are more items to fetch.
  final bool hasMore;

  /// Whether an error occurred.
  final bool hasError;

  /// Optional error message to display.
  final String? errorMessage;

  /// Pull-to-refresh callback.
  final Future<void> Function()? onRefresh;

  /// Called when the user scrolls near the bottom to load more items.
  final VoidCallback? onLoadMore;

  /// Called when the user taps Retry on the error state.
  final VoidCallback? onRetry;

  /// Icon for the empty state.
  final IconData emptyIcon;

  /// Title for the empty state.
  final String emptyTitle;

  /// Optional subtitle for the empty state.
  final String? emptyMessage;

  /// Optional separator between items. Defaults to no separator.
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  /// Padding around the list.
  final EdgeInsetsGeometry? padding;

  /// Distance from the bottom at which [onLoadMore] triggers.
  final double loadMoreThreshold;

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
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
    if (!widget.hasMore || widget.isLoadingMore) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - widget.loadMoreThreshold) {
      widget.onLoadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initial loading
    if (widget.isLoading && widget.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Error with no data
    if (widget.hasError && widget.items.isEmpty) {
      return _ErrorView(
        message: widget.errorMessage ?? 'Something went wrong',
        onRetry: widget.onRetry,
      );
    }

    // Empty
    if (widget.items.isEmpty) {
      return _EmptyView(
        icon: widget.emptyIcon,
        title: widget.emptyTitle,
        message: widget.emptyMessage,
      );
    }

    // Total count includes loading indicator at the bottom
    final itemCount =
        widget.items.length + (widget.isLoadingMore || widget.hasMore ? 1 : 0);

    Widget list;

    if (widget.separatorBuilder != null) {
      list = ListView.separated(
        controller: _scrollController,
        padding: widget.padding ?? const EdgeInsets.only(bottom: 16),
        itemCount: itemCount,
        separatorBuilder: widget.separatorBuilder!,
        itemBuilder: _buildItem,
      );
    } else {
      list = ListView.builder(
        controller: _scrollController,
        padding: widget.padding ?? const EdgeInsets.only(bottom: 16),
        itemCount: itemCount,
        itemBuilder: _buildItem,
      );
    }

    if (widget.onRefresh != null) {
      return RefreshIndicator(
        onRefresh: widget.onRefresh!,
        child: list,
      );
    }
    return list;
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index >= widget.items.length) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return widget.itemBuilder(context, widget.items[index], index);
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: PlaneColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({
    required this.icon,
    required this.title,
    this.message,
  });

  final IconData icon;
  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: PlaneColors.grey400),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: const TextStyle(color: PlaneColors.grey500),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
