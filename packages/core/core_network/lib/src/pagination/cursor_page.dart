/// A single page of cursor-paginated results from the Plane API.
class CursorPage<T> {
  const CursorPage({
    required this.items,
    required this.hasMore,
    this.nextCursor,
    this.previousCursor,
    this.totalCount,
  });

  /// The items in this page.
  final List<T> items;

  /// Whether more pages exist after this one.
  final bool hasMore;

  /// Cursor string for fetching the next page, or `null` if this
  /// is the last.
  final String? nextCursor;

  /// Cursor string for fetching the previous page, or `null` if
  /// this is the first.
  final String? previousCursor;

  /// Total number of results across all pages, when provided by
  /// the API.
  final int? totalCount;

  /// Creates an empty page with no items.
  static CursorPage<T> empty<T>() => CursorPage<T>(
        items: const [],
        hasMore: false,
      );
}
