import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_filter_provider.g.dart';

/// Optional project filter for search results.
/// Holds the project ID to filter by, or null for all projects.
@riverpod
class SearchFilter extends _$SearchFilter {
  @override
  String? build() => null;

  // ignore: use_setters_to_change_properties
  void setProject(String? projectId) {
    state = projectId;
  }

  void clear() {
    state = null;
  }
}
