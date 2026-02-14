import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_query_provider.g.dart';

/// Holds the current search query string.
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  // ignore: use_setters_to_change_properties
  void update(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}
