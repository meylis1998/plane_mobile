// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_comments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentRepositoryNotifierHash() =>
    r'30af7187722680800e4d9416d772041c3d6fd1f8';

/// Provider for the comment repository.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [CommentRepositoryNotifier].
@ProviderFor(CommentRepositoryNotifier)
final commentRepositoryNotifierProvider =
    NotifierProvider<CommentRepositoryNotifier, CommentRepository>.internal(
      CommentRepositoryNotifier.new,
      name: r'commentRepositoryNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$commentRepositoryNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CommentRepositoryNotifier = Notifier<CommentRepository>;
String _$workItemCommentsHash() => r'8d800457f9a82d20ed1c76c3e276be3a23d97a4c';

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

abstract class _$WorkItemComments
    extends BuildlessAutoDisposeAsyncNotifier<List<Comment>> {
  late final String workspaceSlug;
  late final String projectId;
  late final String workItemId;

  FutureOr<List<Comment>> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });
}

/// See also [WorkItemComments].
@ProviderFor(WorkItemComments)
const workItemCommentsProvider = WorkItemCommentsFamily();

/// See also [WorkItemComments].
class WorkItemCommentsFamily extends Family<AsyncValue<List<Comment>>> {
  /// See also [WorkItemComments].
  const WorkItemCommentsFamily();

  /// See also [WorkItemComments].
  WorkItemCommentsProvider call({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) {
    return WorkItemCommentsProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  WorkItemCommentsProvider getProviderOverride(
    covariant WorkItemCommentsProvider provider,
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
  String? get name => r'workItemCommentsProvider';
}

/// See also [WorkItemComments].
class WorkItemCommentsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<WorkItemComments, List<Comment>> {
  /// See also [WorkItemComments].
  WorkItemCommentsProvider({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) : this._internal(
         () => WorkItemComments()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId
           ..workItemId = workItemId,
         from: workItemCommentsProvider,
         name: r'workItemCommentsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$workItemCommentsHash,
         dependencies: WorkItemCommentsFamily._dependencies,
         allTransitiveDependencies:
             WorkItemCommentsFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         workItemId: workItemId,
       );

  WorkItemCommentsProvider._internal(
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
  FutureOr<List<Comment>> runNotifierBuild(
    covariant WorkItemComments notifier,
  ) {
    return notifier.build(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  Override overrideWith(WorkItemComments Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkItemCommentsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WorkItemComments, List<Comment>>
  createElement() {
    return _WorkItemCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkItemCommentsProvider &&
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
mixin WorkItemCommentsRef
    on AutoDisposeAsyncNotifierProviderRef<List<Comment>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `workItemId` of this provider.
  String get workItemId;
}

class _WorkItemCommentsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<WorkItemComments, List<Comment>>
    with WorkItemCommentsRef {
  _WorkItemCommentsProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as WorkItemCommentsProvider).workspaceSlug;
  @override
  String get projectId => (origin as WorkItemCommentsProvider).projectId;
  @override
  String get workItemId => (origin as WorkItemCommentsProvider).workItemId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
