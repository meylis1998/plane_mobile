// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_members_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectMembersHash() => r'd8cfe61cb19e200904e4f57e71096c27bb30f1bb';

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

/// Provider that exposes a list of project members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the project API to fetch members.
///
/// Copied from [projectMembers].
@ProviderFor(projectMembers)
const projectMembersProvider = ProjectMembersFamily();

/// Provider that exposes a list of project members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the project API to fetch members.
///
/// Copied from [projectMembers].
class ProjectMembersFamily extends Family<AsyncValue<List<Member>>> {
  /// Provider that exposes a list of project members.
  ///
  /// Currently returns an empty stub list. The real implementation
  /// will call the project API to fetch members.
  ///
  /// Copied from [projectMembers].
  const ProjectMembersFamily();

  /// Provider that exposes a list of project members.
  ///
  /// Currently returns an empty stub list. The real implementation
  /// will call the project API to fetch members.
  ///
  /// Copied from [projectMembers].
  ProjectMembersProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return ProjectMembersProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  ProjectMembersProvider getProviderOverride(
    covariant ProjectMembersProvider provider,
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
  String? get name => r'projectMembersProvider';
}

/// Provider that exposes a list of project members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the project API to fetch members.
///
/// Copied from [projectMembers].
class ProjectMembersProvider extends AutoDisposeFutureProvider<List<Member>> {
  /// Provider that exposes a list of project members.
  ///
  /// Currently returns an empty stub list. The real implementation
  /// will call the project API to fetch members.
  ///
  /// Copied from [projectMembers].
  ProjectMembersProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => projectMembers(
           ref as ProjectMembersRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: projectMembersProvider,
         name: r'projectMembersProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$projectMembersHash,
         dependencies: ProjectMembersFamily._dependencies,
         allTransitiveDependencies:
             ProjectMembersFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  ProjectMembersProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Member>> Function(ProjectMembersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectMembersProvider._internal(
        (ref) => create(ref as ProjectMembersRef),
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
  AutoDisposeFutureProviderElement<List<Member>> createElement() {
    return _ProjectMembersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectMembersProvider &&
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
mixin ProjectMembersRef on AutoDisposeFutureProviderRef<List<Member>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectMembersProviderElement
    extends AutoDisposeFutureProviderElement<List<Member>>
    with ProjectMembersRef {
  _ProjectMembersProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as ProjectMembersProvider).workspaceSlug;
  @override
  String get projectId => (origin as ProjectMembersProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
