import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

/// Displayed when a search query returns no matching results.
class SearchNoResults extends StatelessWidget {
  const SearchNoResults({required this.query, super.key});

  final String query;

  @override
  Widget build(BuildContext context) {
    return PlaneEmptyState(
      icon: Icons.search_off,
      title: 'No results found',
      message: 'No work items matched "$query". '
          'Try a different search term.',
    );
  }
}
