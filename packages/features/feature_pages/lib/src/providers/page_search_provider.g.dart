// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredPagesHash() => r'9cb9701fdcd67c4dcdf42e14ceab7a44750e7985';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Returns a filtered page list based on the search query.
///
/// Copied from [filteredPages].
@ProviderFor(filteredPages)
const filteredPagesProvider = FilteredPagesFamily();

/// Returns a filtered page list based on the search query.
///
/// Copied from [filteredPages].
class FilteredPagesFamily extends Family<AsyncValue<List<Page>>> {
  /// Returns a filtered page list based on the search query.
  ///
  /// Copied from [filteredPages].
  const FilteredPagesFamily();

  /// Returns a filtered page list based on the search query.
  ///
  /// Copied from [filteredPages].
  FilteredPagesProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return FilteredPagesProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  FilteredPagesProvider getProviderOverride(
    covariant FilteredPagesProvider provider,
  ) {
    return call(
      workspaceSlug: provider.workspaceSlug,
      projectId: provider.projectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredPagesProvider';
}

/// Returns a filtered page list based on the search query.
///
/// Copied from [filteredPages].
class FilteredPagesProvider extends AutoDisposeFutureProvider<List<Page>> {
  /// Returns a filtered page list based on the search query.
  ///
  /// Copied from [filteredPages].
  FilteredPagesProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => filteredPages(
           ref as FilteredPagesRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: filteredPagesProvider,
         name: r'filteredPagesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$filteredPagesHash,
         dependencies: FilteredPagesFamily._dependencies,
         allTransitiveDependencies:
             FilteredPagesFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  FilteredPagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workspaceSlug,
    required this.projectId,
  }) : super.internal();

  final String workspaceSlug;
  final String projectId;

  @override
  Override overrideWith(
    FutureOr<List<Page>> Function(FilteredPagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredPagesProvider._internal(
        (ref) => create(ref as FilteredPagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Page>> createElement() {
    return _FilteredPagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredPagesProvider &&
        other.workspaceSlug == workspaceSlug &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workspaceSlug.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredPagesRef on AutoDisposeFutureProviderRef<List<Page>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _FilteredPagesProviderElement
    extends AutoDisposeFutureProviderElement<List<Page>>
    with FilteredPagesRef {
  _FilteredPagesProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as FilteredPagesProvider).workspaceSlug;
  @override
  String get projectId => (origin as FilteredPagesProvider).projectId;
}

String _$pageSearchQueryHash() => r'e3ed71de4abeb8876d7b2ac7a5c5688953e625af';

/// Holds the current search query for the page list.
///
/// Copied from [PageSearchQuery].
@ProviderFor(PageSearchQuery)
final pageSearchQueryProvider =
    AutoDisposeNotifierProvider<PageSearchQuery, String>.internal(
      PageSearchQuery.new,
      name: r'pageSearchQueryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pageSearchQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PageSearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
