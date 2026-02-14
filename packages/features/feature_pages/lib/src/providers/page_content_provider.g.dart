// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_content_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageContentHash() => r'ff139dc265668846dfea88db17bbc21e33484c67';

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

/// Provides the raw content string for a page, used by the editor.
///
/// Copied from [pageContent].
@ProviderFor(pageContent)
const pageContentProvider = PageContentFamily();

/// Provides the raw content string for a page, used by the editor.
///
/// Copied from [pageContent].
class PageContentFamily extends Family<AsyncValue<String>> {
  /// Provides the raw content string for a page, used by the editor.
  ///
  /// Copied from [pageContent].
  const PageContentFamily();

  /// Provides the raw content string for a page, used by the editor.
  ///
  /// Copied from [pageContent].
  PageContentProvider call({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  }) {
    return PageContentProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      pageId: pageId,
    );
  }

  @override
  PageContentProvider getProviderOverride(
    covariant PageContentProvider provider,
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
  String? get name => r'pageContentProvider';
}

/// Provides the raw content string for a page, used by the editor.
///
/// Copied from [pageContent].
class PageContentProvider extends AutoDisposeFutureProvider<String> {
  /// Provides the raw content string for a page, used by the editor.
  ///
  /// Copied from [pageContent].
  PageContentProvider({
    required String workspaceSlug,
    required String projectId,
    required String pageId,
  }) : this._internal(
         (ref) => pageContent(
           ref as PageContentRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           pageId: pageId,
         ),
         from: pageContentProvider,
         name: r'pageContentProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$pageContentHash,
         dependencies: PageContentFamily._dependencies,
         allTransitiveDependencies:
             PageContentFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         pageId: pageId,
       );

  PageContentProvider._internal(
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
    FutureOr<String> Function(PageContentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PageContentProvider._internal(
        (ref) => create(ref as PageContentRef),
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
  AutoDisposeFutureProviderElement<String> createElement() {
    return _PageContentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageContentProvider &&
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
mixin PageContentRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `pageId` of this provider.
  String get pageId;
}

class _PageContentProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with PageContentRef {
  _PageContentProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as PageContentProvider).workspaceSlug;
  @override
  String get projectId => (origin as PageContentProvider).projectId;
  @override
  String get pageId => (origin as PageContentProvider).pageId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
