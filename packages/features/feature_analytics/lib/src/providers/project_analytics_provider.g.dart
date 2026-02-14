// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_analytics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectAnalyticsHash() => r'2bf9be0ccad285fb249ca6a7bb214bad9b6eb297';

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

/// Provides project-level analytics data.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates representative sample data based on the project.
///
/// Copied from [projectAnalytics].
@ProviderFor(projectAnalytics)
const projectAnalyticsProvider = ProjectAnalyticsFamily();

/// Provides project-level analytics data.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates representative sample data based on the project.
///
/// Copied from [projectAnalytics].
class ProjectAnalyticsFamily extends Family<AsyncValue<ProjectAnalytics>> {
  /// Provides project-level analytics data.
  ///
  /// In a full implementation this would call a dedicated analytics endpoint.
  /// For now it generates representative sample data based on the project.
  ///
  /// Copied from [projectAnalytics].
  const ProjectAnalyticsFamily();

  /// Provides project-level analytics data.
  ///
  /// In a full implementation this would call a dedicated analytics endpoint.
  /// For now it generates representative sample data based on the project.
  ///
  /// Copied from [projectAnalytics].
  ProjectAnalyticsProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return ProjectAnalyticsProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  ProjectAnalyticsProvider getProviderOverride(
    covariant ProjectAnalyticsProvider provider,
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
  String? get name => r'projectAnalyticsProvider';
}

/// Provides project-level analytics data.
///
/// In a full implementation this would call a dedicated analytics endpoint.
/// For now it generates representative sample data based on the project.
///
/// Copied from [projectAnalytics].
class ProjectAnalyticsProvider
    extends AutoDisposeFutureProvider<ProjectAnalytics> {
  /// Provides project-level analytics data.
  ///
  /// In a full implementation this would call a dedicated analytics endpoint.
  /// For now it generates representative sample data based on the project.
  ///
  /// Copied from [projectAnalytics].
  ProjectAnalyticsProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => projectAnalytics(
           ref as ProjectAnalyticsRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: projectAnalyticsProvider,
         name: r'projectAnalyticsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$projectAnalyticsHash,
         dependencies: ProjectAnalyticsFamily._dependencies,
         allTransitiveDependencies:
             ProjectAnalyticsFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  ProjectAnalyticsProvider._internal(
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
    FutureOr<ProjectAnalytics> Function(ProjectAnalyticsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectAnalyticsProvider._internal(
        (ref) => create(ref as ProjectAnalyticsRef),
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
  AutoDisposeFutureProviderElement<ProjectAnalytics> createElement() {
    return _ProjectAnalyticsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectAnalyticsProvider &&
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
mixin ProjectAnalyticsRef on AutoDisposeFutureProviderRef<ProjectAnalytics> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectAnalyticsProviderElement
    extends AutoDisposeFutureProviderElement<ProjectAnalytics>
    with ProjectAnalyticsRef {
  _ProjectAnalyticsProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as ProjectAnalyticsProvider).workspaceSlug;
  @override
  String get projectId => (origin as ProjectAnalyticsProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
