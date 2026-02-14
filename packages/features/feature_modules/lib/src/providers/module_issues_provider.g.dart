// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_issues_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moduleWorkItemRepositoryHash() =>
    r'31cd45823f1c705c622056473ce71cc8c71285a7';

/// Stub provider for WorkItemRepository.
/// Must be overridden at the app level with a concrete implementation.
///
/// Copied from [moduleWorkItemRepository].
@ProviderFor(moduleWorkItemRepository)
final moduleWorkItemRepositoryProvider = Provider<WorkItemRepository>.internal(
  moduleWorkItemRepository,
  name: r'moduleWorkItemRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moduleWorkItemRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ModuleWorkItemRepositoryRef = ProviderRef<WorkItemRepository>;
String _$moduleIssuesHash() => r'02f553a61c8cd82f429403cd5e4da4e086bbf13d';

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

/// Fetches work items assigned to a specific module.
///
/// Copied from [moduleIssues].
@ProviderFor(moduleIssues)
const moduleIssuesProvider = ModuleIssuesFamily();

/// Fetches work items assigned to a specific module.
///
/// Copied from [moduleIssues].
class ModuleIssuesFamily extends Family<AsyncValue<List<WorkItem>>> {
  /// Fetches work items assigned to a specific module.
  ///
  /// Copied from [moduleIssues].
  const ModuleIssuesFamily();

  /// Fetches work items assigned to a specific module.
  ///
  /// Copied from [moduleIssues].
  ModuleIssuesProvider call({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) {
    return ModuleIssuesProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      moduleId: moduleId,
    );
  }

  @override
  ModuleIssuesProvider getProviderOverride(
    covariant ModuleIssuesProvider provider,
  ) {
    return call(
      workspaceSlug: provider.workspaceSlug,
      projectId: provider.projectId,
      moduleId: provider.moduleId,
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
  String? get name => r'moduleIssuesProvider';
}

/// Fetches work items assigned to a specific module.
///
/// Copied from [moduleIssues].
class ModuleIssuesProvider extends AutoDisposeFutureProvider<List<WorkItem>> {
  /// Fetches work items assigned to a specific module.
  ///
  /// Copied from [moduleIssues].
  ModuleIssuesProvider({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) : this._internal(
         (ref) => moduleIssues(
           ref as ModuleIssuesRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           moduleId: moduleId,
         ),
         from: moduleIssuesProvider,
         name: r'moduleIssuesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$moduleIssuesHash,
         dependencies: ModuleIssuesFamily._dependencies,
         allTransitiveDependencies:
             ModuleIssuesFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         moduleId: moduleId,
       );

  ModuleIssuesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workspaceSlug,
    required this.projectId,
    required this.moduleId,
  }) : super.internal();

  final String workspaceSlug;
  final String projectId;
  final String moduleId;

  @override
  Override overrideWith(
    FutureOr<List<WorkItem>> Function(ModuleIssuesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ModuleIssuesProvider._internal(
        (ref) => create(ref as ModuleIssuesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        moduleId: moduleId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WorkItem>> createElement() {
    return _ModuleIssuesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleIssuesProvider &&
        other.workspaceSlug == workspaceSlug &&
        other.projectId == projectId &&
        other.moduleId == moduleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workspaceSlug.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, moduleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ModuleIssuesRef on AutoDisposeFutureProviderRef<List<WorkItem>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `moduleId` of this provider.
  String get moduleId;
}

class _ModuleIssuesProviderElement
    extends AutoDisposeFutureProviderElement<List<WorkItem>>
    with ModuleIssuesRef {
  _ModuleIssuesProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as ModuleIssuesProvider).workspaceSlug;
  @override
  String get projectId => (origin as ModuleIssuesProvider).projectId;
  @override
  String get moduleId => (origin as ModuleIssuesProvider).moduleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
