/// Builder for Plane's cursor-based pagination query parameters.
///
/// Plane's cursor format is: `?cursor=value:offset:is_prev`
/// - **value**: Page size (max 100)
/// - **offset**: Current page number (0-indexed)
/// - **is_prev**: `0` for next, `1` for previous
class CursorParams {
  const CursorParams({
    this.pageSize = 100,
    this.offset = 0,
    this.isPrev = false,
  }) : assert(
          pageSize > 0 && pageSize <= 100,
          'pageSize must be 1-100',
        );

  /// Number of items per page (1-100).
  final int pageSize;

  /// Zero-based page offset.
  final int offset;

  /// Whether this is a backward (previous) page request.
  final bool isPrev;

  /// Encodes to the Plane cursor string format:
  /// `pageSize:offset:is_prev`.
  String encode() => '$pageSize:$offset:${isPrev ? 1 : 0}';

  /// Builds a query-parameters map suitable for Dio's
  /// `queryParameters`.
  Map<String, String> toQueryParameters() => {'cursor': encode()};

  /// Decodes a cursor string (e.g. `"100:2:0"`) back into
  /// [CursorParams].
  ///
  /// Returns `null` if the format is invalid.
  static CursorParams? decode(String cursor) {
    final parts = cursor.split(':');
    if (parts.length != 3) return null;

    final pageSize = int.tryParse(parts[0]);
    final offset = int.tryParse(parts[1]);
    final isPrev = parts[2] == '1';

    if (pageSize == null || offset == null) return null;

    return CursorParams(
      pageSize: pageSize.clamp(1, 100),
      offset: offset,
      isPrev: isPrev,
    );
  }

  /// Returns params for the next page.
  CursorParams nextPage() => CursorParams(
        pageSize: pageSize,
        offset: offset + 1,
      );

  /// Returns params for the previous page (if offset > 0).
  CursorParams? previousPage() {
    if (offset <= 0) return null;
    return CursorParams(
      pageSize: pageSize,
      offset: offset - 1,
      isPrev: true,
    );
  }
}
