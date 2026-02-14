// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageFavoritesHash() => r'd5b5d83e9480aa7bc7d31d85f127d12527261595';

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

/// Filters pages to only show favorites.
///
/// Copied from [pageFavorites].
@ProviderFor(pageFavorites)
const pageFavoritesProvider = PageFavoritesFamily();

/// Filters pages to only show favorites.
///
/// Copied from [pageFavorites].
class PageFavoritesFamily extends Family<AsyncValue<List<Page>>> {
  /// Filters pages to only show favorites.
  ///
  /// Copied from [pageFavorites].
  const PageFavoritesFamily();

  /// Filters pages to only show favorites.
  ///
  /// Copied from [pageFavorites].
  PageFavoritesProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return PageFavoritesProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  PageFavoritesProvider getProviderOverride(
    covariant PageFavoritesProvider provider,
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
  String? get name => r'pageFavoritesProvider';
}

/// Filters pages to only show favorites.
///
/// Copied from [pageFavorites].
class PageFavoritesProvider extends AutoDisposeFutureProvider<List<Page>> {
  /// Filters pages to only show favorites.
  ///
  /// Copied from [pageFavorites].
  PageFavoritesProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => pageFavorites(
           ref as PageFavoritesRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: pageFavoritesProvider,
         name: r'pageFavoritesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$pageFavoritesHash,
         dependencies: PageFavoritesFamily._dependencies,
         allTransitiveDependencies:
             PageFavoritesFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  PageFavoritesProvider._internal(
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
    FutureOr<List<Page>> Function(PageFavoritesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PageFavoritesProvider._internal(
        (ref) => create(ref as PageFavoritesRef),
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
    return _PageFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageFavoritesProvider &&
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
mixin PageFavoritesRef on AutoDisposeFutureProviderRef<List<Page>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _PageFavoritesProviderElement
    extends AutoDisposeFutureProviderElement<List<Page>>
    with PageFavoritesRef {
  _PageFavoritesProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as PageFavoritesProvider).workspaceSlug;
  @override
  String get projectId => (origin as PageFavoritesProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
