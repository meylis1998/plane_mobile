import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_searches_provider.g.dart';

/// Stores and retrieves recent search terms in memory.
/// Keeps the last 10 searches.
@Riverpod(keepAlive: true)
class RecentSearches extends _$RecentSearches {
  static const _maxRecent = 10;

  @override
  List<String> build() => [];

  /// Adds a search term to the top of the recent list.
  void add(String term) {
    final trimmed = term.trim();
    if (trimmed.isEmpty) return;

    final updated = [
      trimmed,
      ...state.where((s) => s != trimmed),
    ];
    state = updated.take(_maxRecent).toList();
  }

  /// Removes a specific search term from the recent list.
  void remove(String term) {
    state = state.where((s) => s != term).toList();
  }

  /// Clears all recent searches.
  void clear() {
    state = [];
  }
}
