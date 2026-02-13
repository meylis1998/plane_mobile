import 'package:core_network/src/pagination/cursor_page.dart';

/// Parses a raw JSON map from the Plane API into a typed [CursorPage].
///
/// The Plane API typically returns paginated results as:
/// ```json
/// {
///   "results": [ ... ],
///   "next_cursor": "100:1:0",
///   "prev_cursor": "100:0:1",
///   "total_count": 42,
///   "next_page_results": true
/// }
/// ```
class CursorPageParser {
  const CursorPageParser._();

  /// Parses a paginated JSON response into a [CursorPage].
  ///
  /// [json] is the raw decoded response body.
  /// [fromJson] converts each item in the `results` array to type [T].
  static CursorPage<T> parse<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final results = json['results'] as List<dynamic>? ?? [];

    return CursorPage<T>(
      items: results
          .cast<Map<String, dynamic>>()
          .map(fromJson)
          .toList(growable: false),
      hasMore: json['next_page_results'] as bool? ?? false,
      nextCursor: json['next_cursor'] as String?,
      previousCursor: json['prev_cursor'] as String?,
      totalCount: json['total_count'] as int?,
    );
  }
}
