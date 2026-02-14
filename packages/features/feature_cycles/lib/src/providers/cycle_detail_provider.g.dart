// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cycleDetailHash() => r'5e44f360b917a4faead511fa3d97bff420f12a3f';

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

/// See also [cycleDetail].
@ProviderFor(cycleDetail)
const cycleDetailProvider = CycleDetailFamily();

/// See also [cycleDetail].
class CycleDetailFamily extends Family<AsyncValue<Cycle>> {
  /// See also [cycleDetail].
  const CycleDetailFamily();

  /// See also [cycleDetail].
  CycleDetailProvider call({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) {
    return CycleDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      cycleId: cycleId,
    );
  }

  @override
  CycleDetailProvider getProviderOverride(
    covariant CycleDetailProvider provider,
  ) {
    return call(
      workspaceSlug: provider.workspaceSlug,
      projectId: provider.projectId,
      cycleId: provider.cycleId,
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
  String? get name => r'cycleDetailProvider';
}

/// See also [cycleDetail].
class CycleDetailProvider extends AutoDisposeFutureProvider<Cycle> {
  /// See also [cycleDetail].
  CycleDetailProvider({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) : this._internal(
         (ref) => cycleDetail(
           ref as CycleDetailRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           cycleId: cycleId,
         ),
         from: cycleDetailProvider,
         name: r'cycleDetailProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$cycleDetailHash,
         dependencies: CycleDetailFamily._dependencies,
         allTransitiveDependencies:
             CycleDetailFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         cycleId: cycleId,
       );

  CycleDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workspaceSlug,
    required this.projectId,
    required this.cycleId,
  }) : super.internal();

  final String workspaceSlug;
  final String projectId;
  final String cycleId;

  @override
  Override overrideWith(
    FutureOr<Cycle> Function(CycleDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CycleDetailProvider._internal(
        (ref) => create(ref as CycleDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        cycleId: cycleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Cycle> createElement() {
    return _CycleDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CycleDetailProvider &&
        other.workspaceSlug == workspaceSlug &&
        other.projectId == projectId &&
        other.cycleId == cycleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workspaceSlug.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, cycleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CycleDetailRef on AutoDisposeFutureProviderRef<Cycle> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `cycleId` of this provider.
  String get cycleId;
}

class _CycleDetailProviderElement
    extends AutoDisposeFutureProviderElement<Cycle>
    with CycleDetailRef {
  _CycleDetailProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as CycleDetailProvider).workspaceSlug;
  @override
  String get projectId => (origin as CycleDetailProvider).projectId;
  @override
  String get cycleId => (origin as CycleDetailProvider).cycleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
