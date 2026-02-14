// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_item_attachments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workItemAttachmentsHash() =>
    r'3eef7b55ab4f259893093f737bba4c1bbc1d5799';

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

abstract class _$WorkItemAttachments
    extends BuildlessAutoDisposeAsyncNotifier<List<Attachment>> {
  late final String workspaceSlug;
  late final String projectId;
  late final String workItemId;

  FutureOr<List<Attachment>> build({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  });
}

/// Fetches and caches the list of attachments for a given work item.
///
/// Copied from [WorkItemAttachments].
@ProviderFor(WorkItemAttachments)
const workItemAttachmentsProvider = WorkItemAttachmentsFamily();

/// Fetches and caches the list of attachments for a given work item.
///
/// Copied from [WorkItemAttachments].
class WorkItemAttachmentsFamily extends Family<AsyncValue<List<Attachment>>> {
  /// Fetches and caches the list of attachments for a given work item.
  ///
  /// Copied from [WorkItemAttachments].
  const WorkItemAttachmentsFamily();

  /// Fetches and caches the list of attachments for a given work item.
  ///
  /// Copied from [WorkItemAttachments].
  WorkItemAttachmentsProvider call({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) {
    return WorkItemAttachmentsProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  WorkItemAttachmentsProvider getProviderOverride(
    covariant WorkItemAttachmentsProvider provider,
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
  String? get name => r'workItemAttachmentsProvider';
}

/// Fetches and caches the list of attachments for a given work item.
///
/// Copied from [WorkItemAttachments].
class WorkItemAttachmentsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          WorkItemAttachments,
          List<Attachment>
        > {
  /// Fetches and caches the list of attachments for a given work item.
  ///
  /// Copied from [WorkItemAttachments].
  WorkItemAttachmentsProvider({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) : this._internal(
         () => WorkItemAttachments()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId
           ..workItemId = workItemId,
         from: workItemAttachmentsProvider,
         name: r'workItemAttachmentsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$workItemAttachmentsHash,
         dependencies: WorkItemAttachmentsFamily._dependencies,
         allTransitiveDependencies:
             WorkItemAttachmentsFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         workItemId: workItemId,
       );

  WorkItemAttachmentsProvider._internal(
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
  FutureOr<List<Attachment>> runNotifierBuild(
    covariant WorkItemAttachments notifier,
  ) {
    return notifier.build(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      workItemId: workItemId,
    );
  }

  @override
  Override overrideWith(WorkItemAttachments Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkItemAttachmentsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WorkItemAttachments, List<Attachment>>
  createElement() {
    return _WorkItemAttachmentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkItemAttachmentsProvider &&
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
mixin WorkItemAttachmentsRef
    on AutoDisposeAsyncNotifierProviderRef<List<Attachment>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `workItemId` of this provider.
  String get workItemId;
}

class _WorkItemAttachmentsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          WorkItemAttachments,
          List<Attachment>
        >
    with WorkItemAttachmentsRef {
  _WorkItemAttachmentsProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as WorkItemAttachmentsProvider).workspaceSlug;
  @override
  String get projectId => (origin as WorkItemAttachmentsProvider).projectId;
  @override
  String get workItemId => (origin as WorkItemAttachmentsProvider).workItemId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
