// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cycleListHash() => r'2196ff5e171c52de58bf931511dcab654f989702';

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

abstract class _$CycleList
    extends BuildlessAutoDisposeAsyncNotifier<List<Cycle>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<List<Cycle>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [CycleList].
@ProviderFor(CycleList)
const cycleListProvider = CycleListFamily();

/// See also [CycleList].
class CycleListFamily extends Family<AsyncValue<List<Cycle>>> {
  /// See also [CycleList].
  const CycleListFamily();

  /// See also [CycleList].
  CycleListProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return CycleListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  CycleListProvider getProviderOverride(covariant CycleListProvider provider) {
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
  String? get name => r'cycleListProvider';
}

/// See also [CycleList].
class CycleListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CycleList, List<Cycle>> {
  /// See also [CycleList].
  CycleListProvider({required String workspaceSlug, required String projectId})
    : this._internal(
        () => CycleList()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId,
        from: cycleListProvider,
        name: r'cycleListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$cycleListHash,
        dependencies: CycleListFamily._dependencies,
        allTransitiveDependencies: CycleListFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      );

  CycleListProvider._internal(
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
  FutureOr<List<Cycle>> runNotifierBuild(covariant CycleList notifier) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(CycleList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CycleListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CycleList, List<Cycle>>
  createElement() {
    return _CycleListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CycleListProvider &&
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
mixin CycleListRef on AutoDisposeAsyncNotifierProviderRef<List<Cycle>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _CycleListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CycleList, List<Cycle>>
    with CycleListRef {
  _CycleListProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as CycleListProvider).workspaceSlug;
  @override
  String get projectId => (origin as CycleListProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
