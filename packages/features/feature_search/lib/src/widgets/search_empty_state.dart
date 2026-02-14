import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

/// Empty state widget shown when the search query is empty
/// and there are no recent searches.
class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaneEmptyState(
      icon: Icons.search,
      title: 'Search work items',
      message: 'Type a query to search across all work items '
          'in this workspace.',
    );
  }
}
