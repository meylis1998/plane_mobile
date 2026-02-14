// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchFilterHash() => r'08a2f78615f0877a1915813b3aba068162a9ae1e';

/// Optional project filter for search results.
/// Holds the project ID to filter by, or null for all projects.
///
/// Copied from [SearchFilter].
@ProviderFor(SearchFilter)
final searchFilterProvider =
    AutoDisposeNotifierProvider<SearchFilter, String?>.internal(
      SearchFilter.new,
      name: r'searchFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchFilter = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
