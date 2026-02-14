// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workItemDetailHash() => r'e2d83b3daa9439749d2c8ae0f917103e596bcfb1';

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

abstract class _$WorkItemDetail
    extends BuildlessAutoDisposeAsyncNotifier<WorkItem> {
  late final String workspaceSlug;
  late final String projectId;
  late final String workItemId;

  FutureOr<WorkItem> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });
}

/// See also [WorkItemDetail].
@ProviderFor(WorkItemDetail)
const workItemDetailProvider = WorkItemDetailFamily();

/// See also [WorkItemDetail].
class WorkItemDetailFamily extends Family<AsyncValue<WorkItem>> {
  /// See also [WorkItemDetail].
  const WorkItemDetailFamily();

  /// See also [WorkItemDetail].
  WorkItemDetailProvider call({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) {
    return WorkItemDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  WorkItemDetailProvider getProviderOverride(
    covariant WorkItemDetailProvider provider,
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
  String? get name => r'workItemDetailProvider';
}

/// See also [WorkItemDetail].
class WorkItemDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WorkItemDetail, WorkItem> {
  /// See also [WorkItemDetail].
  WorkItemDetailProvider({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) : this._internal(
         () => WorkItemDetail()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId
           ..workItemId = workItemId,
         from: workItemDetailProvider,
         name: r'workItemDetailProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$workItemDetailHash,
         dependencies: WorkItemDetailFamily._dependencies,
         allTransitiveDependencies:
             WorkItemDetailFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         workItemId: workItemId,
       );

  WorkItemDetailProvider._internal(
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
  FutureOr<WorkItem> runNotifierBuild(covariant WorkItemDetail notifier) {
    return notifier.build(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  Override overrideWith(WorkItemDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkItemDetailProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WorkItemDetail, WorkItem>
  createElement() {
    return _WorkItemDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkItemDetailProvider &&
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
mixin WorkItemDetailRef on AutoDisposeAsyncNotifierProviderRef<WorkItem> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `workItemId` of this provider.
  String get workItemId;
}

class _WorkItemDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WorkItemDetail, WorkItem>
    with WorkItemDetailRef {
  _WorkItemDetailProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as WorkItemDetailProvider).workspaceSlug;
  @override
  String get projectId => (origin as WorkItemDetailProvider).projectId;
  @override
  String get workItemId => (origin as WorkItemDetailProvider).workItemId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
