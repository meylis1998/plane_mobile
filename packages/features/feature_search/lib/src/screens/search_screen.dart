import 'dart:async';

import 'package:domain_core/domain_core.dart';
import 'package:feature_search/src/providers/recent_searches_provider.dart';
import 'package:feature_search/src/providers/search_query_provider.dart';
import 'package:feature_search/src/providers/search_results_provider.dart';
import 'package:feature_search/src/widgets/recent_search_chip.dart';
import 'package:feature_search/src/widgets/search_empty_state.dart';
import 'package:feature_search/src/widgets/search_no_results.dart';
import 'package:feature_search/src/widgets/search_result_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Global search screen for work items.
///
/// Features:
/// - Autofocused search bar with debounced input (300ms)
/// - Recent searches shown when query is empty
/// - Results list
/// - Tap result to navigate to work item detail
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({
    required this.workspaceSlug,
    this.onResultTap,
    super.key,
  });

  final String workspaceSlug;
  final void Function(WorkItem workItem)? onResultTap;

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchQueryProvider.notifier).update(value);
    });
  }

  void _onSubmit(String value) {
    _debounce?.cancel();
    final trimmed = value.trim();
    if (trimmed.isNotEmpty) {
      ref.read(searchQueryProvider.notifier).update(trimmed);
      ref.read(recentSearchesProvider.notifier).add(trimmed);
    }
  }

  void _onRecentTap(String term) {
    _controller
      ..text = term
      ..selection = TextSelection.collapsed(offset: term.length);
    ref.read(searchQueryProvider.notifier).update(term);
    ref.read(recentSearchesProvider.notifier).add(term);
  }

  void _onClear() {
    _controller.clear();
    ref.read(searchQueryProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final recentSearches = ref.watch(recentSearchesProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search work items...',
            border: InputBorder.none,
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: _onClear,
                  )
                : null,
          ),
          onChanged: _onQueryChanged,
          onSubmitted: _onSubmit,
        ),
        leading: IconButton(
          icon: const Icon(PlaneIcons.arrowBack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: query.isEmpty
          ? _buildRecentSearches(recentSearches)
          : _buildResults(query),
    );
  }

  Widget _buildRecentSearches(List<String> recentSearches) {
    if (recentSearches.isEmpty) {
      return const SearchEmptyState();
    }

    return Padding(
      padding: const EdgeInsets.all(PlaneSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Recent Searches',
                style: PlaneTypography.titleSmall.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  ref.read(recentSearchesProvider.notifier).clear();
                },
                child: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: PlaneSpacing.sm),
          Wrap(
            spacing: PlaneSpacing.sm,
            runSpacing: PlaneSpacing.sm,
            children: recentSearches.map((term) {
              return RecentSearchChip(
                term: term,
                onTap: () => _onRecentTap(term),
                onRemove: () {
                  ref.read(recentSearchesProvider.notifier).remove(term);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildResults(String query) {
    final asyncResults = ref.watch(
      searchResultsProvider(
        workspaceSlug: widget.workspaceSlug,
        query: query,
      ),
    );

    return asyncResults.when(
      loading: PlaneLoadingShimmer.list,
      error: (error, stack) => PlaneErrorWidget(
        message: 'Search failed',
        detail: error.toString(),
      ),
      data: (results) {
        if (results.isEmpty) {
          return SearchNoResults(query: query);
        }

        return ListView.separated(
          itemCount: results.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = results[index];
            return SearchResultTile(
              workItem: item,
              onTap: () => widget.onResultTap?.call(item),
            );
          },
        );
      },
    );
  }
}
