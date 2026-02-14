// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cycleAnalyticsHash() => r'3f34b75751a23314c87dca786ba6a9b46f0218ee';

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

/// Provides burndown chart data for a cycle.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates sample data from the cycle's start/end dates
/// and total/completed issues.
///
/// Copied from [cycleAnalytics].
@ProviderFor(cycleAnalytics)
const cycleAnalyticsProvider = CycleAnalyticsFamily();

/// Provides burndown chart data for a cycle.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates sample data from the cycle's start/end dates
/// and total/completed issues.
///
/// Copied from [cycleAnalytics].
class CycleAnalyticsFamily extends Family<AsyncValue<List<CycleProgress>>> {
  /// Provides burndown chart data for a cycle.
  ///
  /// In a full implementation this would call a dedicated analytics endpoint.
  /// For now it generates sample data from the cycle's start/end dates
  /// and total/completed issues.
  ///
  /// Copied from [cycleAnalytics].
  const CycleAnalyticsFamily();

  /// Provides burndown chart data for a cycle.
  ///
  /// In a full implementation this would call a dedicated analytics endpoint.
  /// For now it generates sample data from the cycle's start/end dates
  /// and total/completed issues.
  ///
  /// Copied from [cycleAnalytics].
  CycleAnalyticsProvider call({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) {
    return CycleAnalyticsProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      cycleId: cycleId,
    );
  }

  @override
  CycleAnalyticsProvider getProviderOverride(
    covariant CycleAnalyticsProvider provider,
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
  String? get name => r'cycleAnalyticsProvider';
}

/// Provides burndown chart data for a cycle.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates sample data from the cycle's start/end dates
/// and total/completed issues.
///
/// Copied from [cycleAnalytics].
class CycleAnalyticsProvider
    extends AutoDisposeFutureProvider<List<CycleProgress>> {
  /// Provides burndown chart data for a cycle.
  ///
  /// In a full implementation this would call a dedicated analytics endpoint.
  /// For now it generates sample data from the cycle's start/end dates
  /// and total/completed issues.
  ///
  /// Copied from [cycleAnalytics].
  CycleAnalyticsProvider({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) : this._internal(
         (ref) => cycleAnalytics(
           ref as CycleAnalyticsRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           cycleId: cycleId,
         ),
         from: cycleAnalyticsProvider,
         name: r'cycleAnalyticsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$cycleAnalyticsHash,
         dependencies: CycleAnalyticsFamily._dependencies,
         allTransitiveDependencies:
             CycleAnalyticsFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         cycleId: cycleId,
       );

  CycleAnalyticsProvider._internal(
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
    FutureOr<List<CycleProgress>> Function(CycleAnalyticsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CycleAnalyticsProvider._internal(
        (ref) => create(ref as CycleAnalyticsRef),
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
  AutoDisposeFutureProviderElement<List<CycleProgress>> createElement() {
    return _CycleAnalyticsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CycleAnalyticsProvider &&
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
mixin CycleAnalyticsRef on AutoDisposeFutureProviderRef<List<CycleProgress>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `cycleId` of this provider.
  String get cycleId;
}

class _CycleAnalyticsProviderElement
    extends AutoDisposeFutureProviderElement<List<CycleProgress>>
    with CycleAnalyticsRef {
  _CycleAnalyticsProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as CycleAnalyticsProvider).workspaceSlug;
  @override
  String get projectId => (origin as CycleAnalyticsProvider).projectId;
  @override
  String get cycleId => (origin as CycleAnalyticsProvider).cycleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
