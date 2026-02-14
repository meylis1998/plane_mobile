// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_kanban_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workItemKanbanHash() => r'affb89e221b6dc7b3bb2d8b7eb0d3c93bf82e951';

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

abstract class _$WorkItemKanban
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, List<WorkItem>>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<Map<String, List<WorkItem>>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [WorkItemKanban].
@ProviderFor(WorkItemKanban)
const workItemKanbanProvider = WorkItemKanbanFamily();

/// See also [WorkItemKanban].
class WorkItemKanbanFamily
    extends Family<AsyncValue<Map<String, List<WorkItem>>>> {
  /// See also [WorkItemKanban].
  const WorkItemKanbanFamily();

  /// See also [WorkItemKanban].
  WorkItemKanbanProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return WorkItemKanbanProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  WorkItemKanbanProvider getProviderOverride(
    covariant WorkItemKanbanProvider provider,
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
  String? get name => r'workItemKanbanProvider';
}

/// See also [WorkItemKanban].
class WorkItemKanbanProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          WorkItemKanban,
          Map<String, List<WorkItem>>
        > {
  /// See also [WorkItemKanban].
  WorkItemKanbanProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         () => WorkItemKanban()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId,
         from: workItemKanbanProvider,
         name: r'workItemKanbanProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$workItemKanbanHash,
         dependencies: WorkItemKanbanFamily._dependencies,
         allTransitiveDependencies:
             WorkItemKanbanFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  WorkItemKanbanProvider._internal(
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
  FutureOr<Map<String, List<WorkItem>>> runNotifierBuild(
    covariant WorkItemKanban notifier,
  ) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(WorkItemKanban Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkItemKanbanProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<
    WorkItemKanban,
    Map<String, List<WorkItem>>
  >
  createElement() {
    return _WorkItemKanbanProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkItemKanbanProvider &&
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
mixin WorkItemKanbanRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, List<WorkItem>>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _WorkItemKanbanProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          WorkItemKanban,
          Map<String, List<WorkItem>>
        >
    with WorkItemKanbanRef {
  _WorkItemKanbanProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as WorkItemKanbanProvider).workspaceSlug;
  @override
  String get projectId => (origin as WorkItemKanbanProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
