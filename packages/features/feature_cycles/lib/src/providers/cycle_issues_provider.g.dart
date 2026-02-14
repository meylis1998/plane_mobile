// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_issues_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cycleIssuesHash() => r'b9e3b6ff3ee8d866daa40b163126a4136b6f8b89';

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

/// Provider that returns work items assigned to a specific cycle.
/// This watches the work item repository (via the cycle list provider's
/// repository) and filters items by cycle ID.
///
/// In a full implementation this would call a dedicated cycle-issues endpoint.
/// For now it uses the work item repository's getByFilter with cycleId filter.
///
/// Copied from [cycleIssues].
@ProviderFor(cycleIssues)
const cycleIssuesProvider = CycleIssuesFamily();

/// Provider that returns work items assigned to a specific cycle.
/// This watches the work item repository (via the cycle list provider's
/// repository) and filters items by cycle ID.
///
/// In a full implementation this would call a dedicated cycle-issues endpoint.
/// For now it uses the work item repository's getByFilter with cycleId filter.
///
/// Copied from [cycleIssues].
class CycleIssuesFamily extends Family<AsyncValue<List<WorkItem>>> {
  /// Provider that returns work items assigned to a specific cycle.
  /// This watches the work item repository (via the cycle list provider's
  /// repository) and filters items by cycle ID.
  ///
  /// In a full implementation this would call a dedicated cycle-issues endpoint.
  /// For now it uses the work item repository's getByFilter with cycleId filter.
  ///
  /// Copied from [cycleIssues].
  const CycleIssuesFamily();

  /// Provider that returns work items assigned to a specific cycle.
  /// This watches the work item repository (via the cycle list provider's
  /// repository) and filters items by cycle ID.
  ///
  /// In a full implementation this would call a dedicated cycle-issues endpoint.
  /// For now it uses the work item repository's getByFilter with cycleId filter.
  ///
  /// Copied from [cycleIssues].
  CycleIssuesProvider call({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) {
    return CycleIssuesProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      cycleId: cycleId,
    );
  }

  @override
  CycleIssuesProvider getProviderOverride(
    covariant CycleIssuesProvider provider,
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
  String? get name => r'cycleIssuesProvider';
}

/// Provider that returns work items assigned to a specific cycle.
/// This watches the work item repository (via the cycle list provider's
/// repository) and filters items by cycle ID.
///
/// In a full implementation this would call a dedicated cycle-issues endpoint.
/// For now it uses the work item repository's getByFilter with cycleId filter.
///
/// Copied from [cycleIssues].
class CycleIssuesProvider extends AutoDisposeFutureProvider<List<WorkItem>> {
  /// Provider that returns work items assigned to a specific cycle.
  /// This watches the work item repository (via the cycle list provider's
  /// repository) and filters items by cycle ID.
  ///
  /// In a full implementation this would call a dedicated cycle-issues endpoint.
  /// For now it uses the work item repository's getByFilter with cycleId filter.
  ///
  /// Copied from [cycleIssues].
  CycleIssuesProvider({
    required String workspaceSlug,
    required String projectId,
    required String cycleId,
  }) : this._internal(
         (ref) => cycleIssues(
           ref as CycleIssuesRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           cycleId: cycleId,
         ),
         from: cycleIssuesProvider,
         name: r'cycleIssuesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$cycleIssuesHash,
         dependencies: CycleIssuesFamily._dependencies,
         allTransitiveDependencies:
             CycleIssuesFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         cycleId: cycleId,
       );

  CycleIssuesProvider._internal(
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
    FutureOr<List<WorkItem>> Function(CycleIssuesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CycleIssuesProvider._internal(
        (ref) => create(ref as CycleIssuesRef),
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
  AutoDisposeFutureProviderElement<List<WorkItem>> createElement() {
    return _CycleIssuesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CycleIssuesProvider &&
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
mixin CycleIssuesRef on AutoDisposeFutureProviderRef<List<WorkItem>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `cycleId` of this provider.
  String get cycleId;
}

class _CycleIssuesProviderElement
    extends AutoDisposeFutureProviderElement<List<WorkItem>>
    with CycleIssuesRef {
  _CycleIssuesProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as CycleIssuesProvider).workspaceSlug;
  @override
  String get projectId => (origin as CycleIssuesProvider).projectId;
  @override
  String get cycleId => (origin as CycleIssuesProvider).cycleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
