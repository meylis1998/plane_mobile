// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_searches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentSearchesHash() => r'9d3fbce7c9e8b57dbd3a4e45039c7ddc7912ea91';

/// Stores and retrieves recent search terms in memory.
/// Keeps the last 10 searches.
///
/// Copied from [RecentSearches].
@ProviderFor(RecentSearches)
final recentSearchesProvider =
    NotifierProvider<RecentSearches, List<String>>.internal(
      RecentSearches.new,
      name: r'recentSearchesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recentSearchesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RecentSearches = Notifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
