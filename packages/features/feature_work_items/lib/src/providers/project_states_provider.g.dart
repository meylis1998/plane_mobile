// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_states_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectStatesNotifierHash() =>
    r'3a23d07c07c26ef331e6bfc5294d00f5a8db5116';

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

abstract class _$ProjectStatesNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkItemState>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<List<WorkItemState>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [ProjectStatesNotifier].
@ProviderFor(ProjectStatesNotifier)
const projectStatesNotifierProvider = ProjectStatesNotifierFamily();

/// See also [ProjectStatesNotifier].
class ProjectStatesNotifierFamily
    extends Family<AsyncValue<List<WorkItemState>>> {
  /// See also [ProjectStatesNotifier].
  const ProjectStatesNotifierFamily();

  /// See also [ProjectStatesNotifier].
  ProjectStatesNotifierProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return ProjectStatesNotifierProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  ProjectStatesNotifierProvider getProviderOverride(
    covariant ProjectStatesNotifierProvider provider,
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
  String? get name => r'projectStatesNotifierProvider';
}

/// See also [ProjectStatesNotifier].
class ProjectStatesNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProjectStatesNotifier,
          List<WorkItemState>
        > {
  /// See also [ProjectStatesNotifier].
  ProjectStatesNotifierProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         () => ProjectStatesNotifier()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId,
         from: projectStatesNotifierProvider,
         name: r'projectStatesNotifierProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$projectStatesNotifierHash,
         dependencies: ProjectStatesNotifierFamily._dependencies,
         allTransitiveDependencies:
             ProjectStatesNotifierFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  ProjectStatesNotifierProvider._internal(
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
  FutureOr<List<WorkItemState>> runNotifierBuild(
    covariant ProjectStatesNotifier notifier,
  ) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(ProjectStatesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectStatesNotifierProvider._internal(
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
    ProjectStatesNotifier,
    List<WorkItemState>
  >
  createElement() {
    return _ProjectStatesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectStatesNotifierProvider &&
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
mixin ProjectStatesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<WorkItemState>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectStatesNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProjectStatesNotifier,
          List<WorkItemState>
        >
    with ProjectStatesNotifierRef {
  _ProjectStatesNotifierProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as ProjectStatesNotifierProvider).workspaceSlug;
  @override
  String get projectId => (origin as ProjectStatesNotifierProvider).projectId;
}

String _$projectRepositoryNotifierHash() =>
    r'3b6548a1020cad485c4c5a7ebd19add90bf7d3f8';

/// Provider for the project repository.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [ProjectRepositoryNotifier].
@ProviderFor(ProjectRepositoryNotifier)
final projectRepositoryNotifierProvider =
    NotifierProvider<ProjectRepositoryNotifier, ProjectRepository>.internal(
      ProjectRepositoryNotifier.new,
      name: r'projectRepositoryNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$projectRepositoryNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProjectRepositoryNotifier = Notifier<ProjectRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
