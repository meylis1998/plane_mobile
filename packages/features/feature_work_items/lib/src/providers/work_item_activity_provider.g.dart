// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_activity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workItemActivityHash() => r'a3426de0048da7029484490549937a8f028d5cc0';

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

abstract class _$WorkItemActivity
    extends BuildlessAutoDisposeAsyncNotifier<List<Activity>> {
  late final String workspaceSlug;
  late final String projectId;
  late final String workItemId;

  FutureOr<List<Activity>> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });
}

/// See also [WorkItemActivity].
@ProviderFor(WorkItemActivity)
const workItemActivityProvider = WorkItemActivityFamily();

/// See also [WorkItemActivity].
class WorkItemActivityFamily extends Family<AsyncValue<List<Activity>>> {
  /// See also [WorkItemActivity].
  const WorkItemActivityFamily();

  /// See also [WorkItemActivity].
  WorkItemActivityProvider call({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) {
    return WorkItemActivityProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  WorkItemActivityProvider getProviderOverride(
    covariant WorkItemActivityProvider provider,
  ) {
    return call(
      workspaceSlug: provider.workspaceSlug,
      projectId: provider.projectId,
      workItemId: provider.workItemId,
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
  String? get name => r'workItemActivityProvider';
}

/// See also [WorkItemActivity].
class WorkItemActivityProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<WorkItemActivity, List<Activity>> {
  /// See also [WorkItemActivity].
  WorkItemActivityProvider({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) : this._internal(
         () => WorkItemActivity()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId
           ..workItemId = workItemId,
         from: workItemActivityProvider,
         name: r'workItemActivityProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$workItemActivityHash,
         dependencies: WorkItemActivityFamily._dependencies,
         allTransitiveDependencies:
             WorkItemActivityFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         workItemId: workItemId,
       );

  WorkItemActivityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workspaceSlug,
    required this.projectId,
    required this.workItemId,
  }) : super.internal();

  final String workspaceSlug;
  final String projectId;
  final String workItemId;

  @override
  FutureOr<List<Activity>> runNotifierBuild(
    covariant WorkItemActivity notifier,
  ) {
    return notifier.build(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  Override overrideWith(WorkItemActivity Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkItemActivityProvider._internal(
        () => create()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId
          ..workItemId = workItemId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        workItemId: workItemId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<WorkItemActivity, List<Activity>>
  createElement() {
    return _WorkItemActivityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkItemActivityProvider &&
        other.workspaceSlug == workspaceSlug &&
        other.projectId == projectId &&
        other.workItemId == workItemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workspaceSlug.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, workItemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkItemActivityRef
    on AutoDisposeAsyncNotifierProviderRef<List<Activity>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `workItemId` of this provider.
  String get workItemId;
}

class _WorkItemActivityProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          WorkItemActivity,
          List<Activity>
        >
    with WorkItemActivityRef {
  _WorkItemActivityProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as WorkItemActivityProvider).workspaceSlug;
  @override
  String get projectId => (origin as WorkItemActivityProvider).projectId;
  @override
  String get workItemId => (origin as WorkItemActivityProvider).workItemId;
}

String _$activityRepositoryNotifierHash() =>
    r'465eb7bdce57ab9a28da4837cbc8a2f6c2d814a5';

/// Provider for the activity repository.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [ActivityRepositoryNotifier].
@ProviderFor(ActivityRepositoryNotifier)
final activityRepositoryNotifierProvider =
    NotifierProvider<ActivityRepositoryNotifier, ActivityRepository>.internal(
      ActivityRepositoryNotifier.new,
      name: r'activityRepositoryNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activityRepositoryNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ActivityRepositoryNotifier = Notifier<ActivityRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
