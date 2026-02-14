// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageDetailHash() => r'8a281e5cc7fa795ff30e02074dcce7f9ec36d205';

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

/// See also [pageDetail].
@ProviderFor(pageDetail)
const pageDetailProvider = PageDetailFamily();

/// See also [pageDetail].
class PageDetailFamily extends Family<AsyncValue<Page>> {
  /// See also [pageDetail].
  const PageDetailFamily();

  /// See also [pageDetail].
  PageDetailProvider call({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  }) {
    return PageDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      pageId: pageId,
    );
  }

  @override
  PageDetailProvider getProviderOverride(
    covariant PageDetailProvider provider,
  ) {
    return call(
      workspaceSlug: provider.workspaceSlug,
      projectId: provider.projectId,
      pageId: provider.pageId,
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
  String? get name => r'pageDetailProvider';
}

/// See also [pageDetail].
class PageDetailProvider extends AutoDisposeFutureProvider<Page> {
  /// See also [pageDetail].
  PageDetailProvider({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  }) : this._internal(
         (ref) => pageDetail(
           ref as PageDetailRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           pageId: pageId,
         ),
         from: pageDetailProvider,
         name: r'pageDetailProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$pageDetailHash,
         dependencies: PageDetailFamily._dependencies,
         allTransitiveDependencies: PageDetailFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         pageId: pageId,
       );

  PageDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workspaceSlug,
    required this.projectId,
    required this.pageId,
  }) : super.internal();

  final String workspaceSlug;
  final String projectId;
  final String pageId;

  @override
  Override overrideWith(
    FutureOr<Page> Function(PageDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PageDetailProvider._internal(
        (ref) => create(ref as PageDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        pageId: pageId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Page> createElement() {
    return _PageDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageDetailProvider &&
        other.workspaceSlug == workspaceSlug &&
        other.projectId == projectId &&
        other.pageId == pageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workspaceSlug.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, pageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PageDetailRef on AutoDisposeFutureProviderRef<Page> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `pageId` of this provider.
  String get pageId;
}

class _PageDetailProviderElement extends AutoDisposeFutureProviderElement<Page>
    with PageDetailRef {
  _PageDetailProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as PageDetailProvider).workspaceSlug;
  @override
  String get projectId => (origin as PageDetailProvider).projectId;
  @override
  String get pageId => (origin as PageDetailProvider).pageId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
