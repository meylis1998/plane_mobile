// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_labels_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectLabelsNotifierHash() =>
    r'33a92b3ef0c29e0de85fe9c01304ef220c798b66';

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

abstract class _$ProjectLabelsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Label>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<List<Label>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [ProjectLabelsNotifier].
@ProviderFor(ProjectLabelsNotifier)
const projectLabelsNotifierProvider = ProjectLabelsNotifierFamily();

/// See also [ProjectLabelsNotifier].
class ProjectLabelsNotifierFamily extends Family<AsyncValue<List<Label>>> {
  /// See also [ProjectLabelsNotifier].
  const ProjectLabelsNotifierFamily();

  /// See also [ProjectLabelsNotifier].
  ProjectLabelsNotifierProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return ProjectLabelsNotifierProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  ProjectLabelsNotifierProvider getProviderOverride(
    covariant ProjectLabelsNotifierProvider provider,
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
  String? get name => r'projectLabelsNotifierProvider';
}

/// See also [ProjectLabelsNotifier].
class ProjectLabelsNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProjectLabelsNotifier,
          List<Label>
        > {
  /// See also [ProjectLabelsNotifier].
  ProjectLabelsNotifierProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         () => ProjectLabelsNotifier()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId,
         from: projectLabelsNotifierProvider,
         name: r'projectLabelsNotifierProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$projectLabelsNotifierHash,
         dependencies: ProjectLabelsNotifierFamily._dependencies,
         allTransitiveDependencies:
             ProjectLabelsNotifierFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  ProjectLabelsNotifierProvider._internal(
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
  FutureOr<List<Label>> runNotifierBuild(
    covariant ProjectLabelsNotifier notifier,
  ) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(ProjectLabelsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectLabelsNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProjectLabelsNotifier, List<Label>>
  createElement() {
    return _ProjectLabelsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectLabelsNotifierProvider &&
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
mixin ProjectLabelsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Label>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ProjectLabelsNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProjectLabelsNotifier,
          List<Label>
        >
    with ProjectLabelsNotifierRef {
  _ProjectLabelsNotifierProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as ProjectLabelsNotifierProvider).workspaceSlug;
  @override
  String get projectId => (origin as ProjectLabelsNotifierProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
