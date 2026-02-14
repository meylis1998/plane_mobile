// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_tree_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageTreeHash() => r'8579a13823e2cfadac21b1f50a775ad19e5b12c1';

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

/// Builds a hierarchical tree from the flat page list.
///
/// Currently the [Page] entity does not have a parentId field,
/// so all pages are treated as root-level nodes. When parentId
/// is added to the entity the tree-building logic will group
/// child pages under their parent.
///
/// Copied from [pageTree].
@ProviderFor(pageTree)
const pageTreeProvider = PageTreeFamily();

/// Builds a hierarchical tree from the flat page list.
///
/// Currently the [Page] entity does not have a parentId field,
/// so all pages are treated as root-level nodes. When parentId
/// is added to the entity the tree-building logic will group
/// child pages under their parent.
///
/// Copied from [pageTree].
class PageTreeFamily extends Family<AsyncValue<List<PageTreeNode>>> {
  /// Builds a hierarchical tree from the flat page list.
  ///
  /// Currently the [Page] entity does not have a parentId field,
  /// so all pages are treated as root-level nodes. When parentId
  /// is added to the entity the tree-building logic will group
  /// child pages under their parent.
  ///
  /// Copied from [pageTree].
  const PageTreeFamily();

  /// Builds a hierarchical tree from the flat page list.
  ///
  /// Currently the [Page] entity does not have a parentId field,
  /// so all pages are treated as root-level nodes. When parentId
  /// is added to the entity the tree-building logic will group
  /// child pages under their parent.
  ///
  /// Copied from [pageTree].
  PageTreeProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return PageTreeProvider(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  PageTreeProvider getProviderOverride(covariant PageTreeProvider provider) {
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
  String? get name => r'pageTreeProvider';
}

/// Builds a hierarchical tree from the flat page list.
///
/// Currently the [Page] entity does not have a parentId field,
/// so all pages are treated as root-level nodes. When parentId
/// is added to the entity the tree-building logic will group
/// child pages under their parent.
///
/// Copied from [pageTree].
class PageTreeProvider extends AutoDisposeFutureProvider<List<PageTreeNode>> {
  /// Builds a hierarchical tree from the flat page list.
  ///
  /// Currently the [Page] entity does not have a parentId field,
  /// so all pages are treated as root-level nodes. When parentId
  /// is added to the entity the tree-building logic will group
  /// child pages under their parent.
  ///
  /// Copied from [pageTree].
  PageTreeProvider({required String workspaceSlug, required String projectId})
    : this._internal(
        (ref) => pageTree(
          ref as PageTreeRef,
          workspaceSlug: workspaceSlug,
          projectId: projectId,
        ),
        from: pageTreeProvider,
        name: r'pageTreeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pageTreeHash,
        dependencies: PageTreeFamily._dependencies,
        allTransitiveDependencies: PageTreeFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      );

  PageTreeProvider._internal(
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
    FutureOr<List<PageTreeNode>> Function(PageTreeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PageTreeProvider._internal(
        (ref) => create(ref as PageTreeRef),
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
  AutoDisposeFutureProviderElement<List<PageTreeNode>> createElement() {
    return _PageTreeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageTreeProvider &&
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
mixin PageTreeRef on AutoDisposeFutureProviderRef<List<PageTreeNode>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _PageTreeProviderElement
    extends AutoDisposeFutureProviderElement<List<PageTreeNode>>
    with PageTreeRef {
  _PageTreeProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as PageTreeProvider).workspaceSlug;
  @override
  String get projectId => (origin as PageTreeProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
