// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cycleAnalyticsDetailHash() =>
    r'009a89073b0bab68cdfd939b10322efffe820b01';

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

/// Provides cycle-level analytics including velocity, completion rate,
/// burndown data, and issue distribution by state.
///
/// Copied from [cycleAnalyticsDetail].
@ProviderFor(cycleAnalyticsDetail)
const cycleAnalyticsDetailProvider = CycleAnalyticsDetailFamily();

/// Provides cycle-level analytics including velocity, completion rate,
/// burndown data, and issue distribution by state.
///
/// Copied from [cycleAnalyticsDetail].
class CycleAnalyticsDetailFamily extends Family<AsyncValue<CycleAnalytics>> {
  /// Provides cycle-level analytics including velocity, completion rate,
  /// burndown data, and issue distribution by state.
  ///
  /// Copied from [cycleAnalyticsDetail].
  const CycleAnalyticsDetailFamily();

  /// Provides cycle-level analytics including velocity, completion rate,
  /// burndown data, and issue distribution by state.
  ///
  /// Copied from [cycleAnalyticsDetail].
  CycleAnalyticsDetailProvider call({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) {
    return CycleAnalyticsDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      cycleId: cycleId,
    );
  }

  @override
  CycleAnalyticsDetailProvider getProviderOverride(
    covariant CycleAnalyticsDetailProvider provider,
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
  String? get name => r'cycleAnalyticsDetailProvider';
}

/// Provides cycle-level analytics including velocity, completion rate,
/// burndown data, and issue distribution by state.
///
/// Copied from [cycleAnalyticsDetail].
class CycleAnalyticsDetailProvider
    extends AutoDisposeFutureProvider<CycleAnalytics> {
  /// Provides cycle-level analytics including velocity, completion rate,
  /// burndown data, and issue distribution by state.
  ///
  /// Copied from [cycleAnalyticsDetail].
  CycleAnalyticsDetailProvider({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) : this._internal(
         (ref) => cycleAnalyticsDetail(
           ref as CycleAnalyticsDetailRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           cycleId: cycleId,
         ),
         from: cycleAnalyticsDetailProvider,
         name: r'cycleAnalyticsDetailProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$cycleAnalyticsDetailHash,
         dependencies: CycleAnalyticsDetailFamily._dependencies,
         allTransitiveDependencies:
             CycleAnalyticsDetailFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         cycleId: cycleId,
       );

  CycleAnalyticsDetailProvider._internal(
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
    FutureOr<CycleAnalytics> Function(CycleAnalyticsDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CycleAnalyticsDetailProvider._internal(
        (ref) => create(ref as CycleAnalyticsDetailRef),
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
  AutoDisposeFutureProviderElement<CycleAnalytics> createElement() {
    return _CycleAnalyticsDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CycleAnalyticsDetailProvider &&
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
mixin CycleAnalyticsDetailRef on AutoDisposeFutureProviderRef<CycleAnalytics> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `cycleId` of this provider.
  String get cycleId;
}

class _CycleAnalyticsDetailProviderElement
    extends AutoDisposeFutureProviderElement<CycleAnalytics>
    with CycleAnalyticsDetailRef {
  _CycleAnalyticsDetailProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as CycleAnalyticsDetailProvider).workspaceSlug;
  @override
  String get projectId => (origin as CycleAnalyticsDetailProvider).projectId;
  @override
  String get cycleId => (origin as CycleAnalyticsDetailProvider).cycleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
