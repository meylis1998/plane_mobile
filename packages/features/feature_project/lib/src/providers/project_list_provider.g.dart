// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectListHash() => r'f5a301eff2b5218f403505de0eba52fcee488680';

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

abstract class _$ProjectList
    extends BuildlessAutoDisposeAsyncNotifier<List<Project>> {
  late final String workspaceSlug;

  FutureOr<List<Project>> build({required String workspaceSlug});
}

/// See also [ProjectList].
@ProviderFor(ProjectList)
const projectListProvider = ProjectListFamily();

/// See also [ProjectList].
class ProjectListFamily extends Family<AsyncValue<List<Project>>> {
  /// See also [ProjectList].
  const ProjectListFamily();

  /// See also [ProjectList].
  ProjectListProvider call({required String workspaceSlug}) {
    return ProjectListProvider(workspaceSlug: workspaceSlug);
  }

  @override
  ProjectListProvider getProviderOverride(
    covariant ProjectListProvider provider,
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
  String? get name => r'projectListProvider';
}

/// See also [ProjectList].
class ProjectListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProjectList, List<Project>> {
  /// See also [ProjectList].
  ProjectListProvider({required String workspaceSlug})
    : this._internal(
        () => ProjectList()..workspaceSlug = workspaceSlug,
        from: projectListProvider,
        name: r'projectListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$projectListHash,
        dependencies: ProjectListFamily._dependencies,
        allTransitiveDependencies: ProjectListFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  ProjectListProvider._internal(
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
  FutureOr<List<Project>> runNotifierBuild(covariant ProjectList notifier) {
    return notifier.build(workspaceSlug: workspaceSlug);
  }

  @override
  Override overrideWith(ProjectList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProjectListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProjectList, List<Project>>
  createElement() {
    return _ProjectListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectListProvider && other.workspaceSlug == workspaceSlug;
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
mixin ProjectListRef on AutoDisposeAsyncNotifierProviderRef<List<Project>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _ProjectListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProjectList, List<Project>>
    with ProjectListRef {
  _ProjectListProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as ProjectListProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
