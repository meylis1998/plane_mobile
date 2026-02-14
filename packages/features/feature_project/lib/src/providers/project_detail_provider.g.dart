// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailHash() => r'29449c072b0f1776e6f3ce5bfb01689d4c04194a';

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

/// See also [projectDetail].
@ProviderFor(projectDetail)
const projectDetailProvider = ProjectDetailFamily();

/// See also [projectDetail].
class ProjectDetailFamily extends Family<AsyncValue<Project>> {
  /// See also [projectDetail].
  const ProjectDetailFamily();

  /// See also [projectDetail].
  ProjectDetailProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return ProjectDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  ProjectDetailProvider getProviderOverride(
    covariant ProjectDetailProvider provider,
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
  String? get name => r'projectDetailProvider';
}

/// See also [projectDetail].
class ProjectDetailProvider extends AutoDisposeFutureProvider<Project> {
  /// See also [projectDetail].
  ProjectDetailProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => projectDetail(
           ref as ProjectDetailRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: projectDetailProvider,
         name: r'projectDetailProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$projectDetailHash,
         dependencies: ProjectDetailFamily._dependencies,
         allTransitiveDependencies:
             ProjectDetailFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  ProjectDetailProvider._internal(
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
    FutureOr<Project> Function(ProjectDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailProvider._internal(
        (ref) => create(ref as ProjectDetailRef),
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
  AutoDisposeFutureProviderElement<Project> createElement() {
    return _ProjectDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailProvider &&
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
mixin ProjectDetailRef on AutoDisposeFutureProviderRef<Project> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectDetailProviderElement
    extends AutoDisposeFutureProviderElement<Project>
    with ProjectDetailRef {
  _ProjectDetailProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as ProjectDetailProvider).workspaceSlug;
  @override
  String get projectId => (origin as ProjectDetailProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
