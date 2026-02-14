// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_members_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectMembersNotifierHash() =>
    r'84d41a74b7af6d2a273307f87ab1a11728cc17b1';

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

abstract class _$ProjectMembersNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Member>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<List<Member>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [ProjectMembersNotifier].
@ProviderFor(ProjectMembersNotifier)
const projectMembersNotifierProvider = ProjectMembersNotifierFamily();

/// See also [ProjectMembersNotifier].
class ProjectMembersNotifierFamily extends Family<AsyncValue<List<Member>>> {
  /// See also [ProjectMembersNotifier].
  const ProjectMembersNotifierFamily();

  /// See also [ProjectMembersNotifier].
  ProjectMembersNotifierProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return ProjectMembersNotifierProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  ProjectMembersNotifierProvider getProviderOverride(
    covariant ProjectMembersNotifierProvider provider,
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
  String? get name => r'projectMembersNotifierProvider';
}

/// See also [ProjectMembersNotifier].
class ProjectMembersNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProjectMembersNotifier,
          List<Member>
        > {
  /// See also [ProjectMembersNotifier].
  ProjectMembersNotifierProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         () => ProjectMembersNotifier()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId,
         from: projectMembersNotifierProvider,
         name: r'projectMembersNotifierProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$projectMembersNotifierHash,
         dependencies: ProjectMembersNotifierFamily._dependencies,
         allTransitiveDependencies:
             ProjectMembersNotifierFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  ProjectMembersNotifierProvider._internal(
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
  FutureOr<List<Member>> runNotifierBuild(
    covariant ProjectMembersNotifier notifier,
  ) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(ProjectMembersNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectMembersNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProjectMembersNotifier, List<Member>>
  createElement() {
    return _ProjectMembersNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectMembersNotifierProvider &&
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
mixin ProjectMembersNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Member>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectMembersNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProjectMembersNotifier,
          List<Member>
        >
    with ProjectMembersNotifierRef {
  _ProjectMembersNotifierProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as ProjectMembersNotifierProvider).workspaceSlug;
  @override
  String get projectId => (origin as ProjectMembersNotifierProvider).projectId;
}

String _$workspaceMembersNotifierHash() =>
    r'f0d7d15f3ad302e367034dd84669d8577f60cb52';

abstract class _$WorkspaceMembersNotifier
    extends BuildlessNotifier<List<Member>> {
  late final String workspaceSlug;

  List<Member> build({required String workspaceSlug});
}

/// Provider for workspace members.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [WorkspaceMembersNotifier].
@ProviderFor(WorkspaceMembersNotifier)
const workspaceMembersNotifierProvider = WorkspaceMembersNotifierFamily();

/// Provider for workspace members.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [WorkspaceMembersNotifier].
class WorkspaceMembersNotifierFamily extends Family<List<Member>> {
  /// Provider for workspace members.
  /// Must be overridden at the app level with a concrete implementation.
  ///
  /// Copied from [WorkspaceMembersNotifier].
  const WorkspaceMembersNotifierFamily();

  /// Provider for workspace members.
  /// Must be overridden at the app level with a concrete implementation.
  ///
  /// Copied from [WorkspaceMembersNotifier].
  WorkspaceMembersNotifierProvider call({required String workspaceSlug}) {
    return WorkspaceMembersNotifierProvider(workspaceSlug: workspaceSlug);
  }

  @override
  WorkspaceMembersNotifierProvider getProviderOverride(
    covariant WorkspaceMembersNotifierProvider provider,
  ) {
    return call(workspaceSlug: provider.workspaceSlug);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workspaceMembersNotifierProvider';
}

/// Provider for workspace members.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [WorkspaceMembersNotifier].
class WorkspaceMembersNotifierProvider
    extends NotifierProviderImpl<WorkspaceMembersNotifier, List<Member>> {
  /// Provider for workspace members.
  /// Must be overridden at the app level with a concrete implementation.
  ///
  /// Copied from [WorkspaceMembersNotifier].
  WorkspaceMembersNotifierProvider({required String workspaceSlug})
    : this._internal(
        () => WorkspaceMembersNotifier()..workspaceSlug = workspaceSlug,
        from: workspaceMembersNotifierProvider,
        name: r'workspaceMembersNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$workspaceMembersNotifierHash,
        dependencies: WorkspaceMembersNotifierFamily._dependencies,
        allTransitiveDependencies:
            WorkspaceMembersNotifierFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  WorkspaceMembersNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workspaceSlug,
  }) : super.internal();

  final String workspaceSlug;

  @override
  List<Member> runNotifierBuild(covariant WorkspaceMembersNotifier notifier) {
    return notifier.build(workspaceSlug: workspaceSlug);
  }

  @override
  Override overrideWith(WorkspaceMembersNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WorkspaceMembersNotifierProvider._internal(
        () => create()..workspaceSlug = workspaceSlug,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workspaceSlug: workspaceSlug,
      ),
    );
  }

  @override
  NotifierProviderElement<WorkspaceMembersNotifier, List<Member>>
  createElement() {
    return _WorkspaceMembersNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkspaceMembersNotifierProvider &&
        other.workspaceSlug == workspaceSlug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workspaceSlug.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkspaceMembersNotifierRef on NotifierProviderRef<List<Member>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _WorkspaceMembersNotifierProviderElement
    extends NotifierProviderElement<WorkspaceMembersNotifier, List<Member>>
    with WorkspaceMembersNotifierRef {
  _WorkspaceMembersNotifierProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as WorkspaceMembersNotifierProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
