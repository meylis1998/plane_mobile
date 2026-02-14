// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pageListHash() => r'420ea711c53a1384599d02827930140a17d1093e';

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

abstract class _$PageList
    extends BuildlessAutoDisposeAsyncNotifier<List<Page>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<List<Page>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [PageList].
@ProviderFor(PageList)
const pageListProvider = PageListFamily();

/// See also [PageList].
class PageListFamily extends Family<AsyncValue<List<Page>>> {
  /// See also [PageList].
  const PageListFamily();

  /// See also [PageList].
  PageListProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return PageListProvider(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  PageListProvider getProviderOverride(covariant PageListProvider provider) {
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
  String? get name => r'pageListProvider';
}

/// See also [PageList].
class PageListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PageList, List<Page>> {
  /// See also [PageList].
  PageListProvider({required String workspaceSlug, required String projectId})
    : this._internal(
        () => PageList()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId,
        from: pageListProvider,
        name: r'pageListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pageListHash,
        dependencies: PageListFamily._dependencies,
        allTransitiveDependencies: PageListFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      );

  PageListProvider._internal(
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
  FutureOr<List<Page>> runNotifierBuild(covariant PageList notifier) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(PageList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PageListProvider._internal(
        () => create()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId,
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
  AutoDisposeAsyncNotifierProviderElement<PageList, List<Page>>
  createElement() {
    return _PageListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PageListProvider &&
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
mixin PageListRef on AutoDisposeAsyncNotifierProviderRef<List<Page>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _PageListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PageList, List<Page>>
    with PageListRef {
  _PageListProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as PageListProvider).workspaceSlug;
  @override
  String get projectId => (origin as PageListProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
