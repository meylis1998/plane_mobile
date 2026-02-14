// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workItemRepositoryNotifierHash() =>
    r'2ccff050e952c12c6608f25d6ab2f2b760044863';

/// Provider for the work item repository.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [WorkItemRepositoryNotifier].
@ProviderFor(WorkItemRepositoryNotifier)
final workItemRepositoryNotifierProvider =
    NotifierProvider<WorkItemRepositoryNotifier, WorkItemRepository>.internal(
      WorkItemRepositoryNotifier.new,
      name: r'workItemRepositoryNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$workItemRepositoryNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WorkItemRepositoryNotifier = Notifier<WorkItemRepository>;
String _$workItemListHash() => r'0d5a055738af6696e8945efd51ac1ea986948917';

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

abstract class _$WorkItemList
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkItem>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<List<WorkItem>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [WorkItemList].
@ProviderFor(WorkItemList)
const workItemListProvider = WorkItemListFamily();

/// See also [WorkItemList].
class WorkItemListFamily extends Family<AsyncValue<List<WorkItem>>> {
  /// See also [WorkItemList].
  const WorkItemListFamily();

  /// See also [WorkItemList].
  WorkItemListProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return WorkItemListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  WorkItemListProvider getProviderOverride(
    covariant WorkItemListProvider provider,
  ) {
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
  String? get name => r'workItemListProvider';
}

/// See also [WorkItemList].
class WorkItemListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<WorkItemList, List<WorkItem>> {
  /// See also [WorkItemList].
  WorkItemListProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         () => WorkItemList()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId,
         from: workItemListProvider,
         name: r'workItemListProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$workItemListHash,
         dependencies: WorkItemListFamily._dependencies,
         allTransitiveDependencies:
             WorkItemListFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  WorkItemListProvider._internal(
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
  FutureOr<List<WorkItem>> runNotifierBuild(covariant WorkItemList notifier) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(WorkItemList Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkItemListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WorkItemList, List<WorkItem>>
  createElement() {
    return _WorkItemListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkItemListProvider &&
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
mixin WorkItemListRef on AutoDisposeAsyncNotifierProviderRef<List<WorkItem>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _WorkItemListProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<WorkItemList, List<WorkItem>>
    with WorkItemListRef {
  _WorkItemListProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as WorkItemListProvider).workspaceSlug;
  @override
  String get projectId => (origin as WorkItemListProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
