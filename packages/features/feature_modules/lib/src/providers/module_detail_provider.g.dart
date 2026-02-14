// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moduleDetailHash() => r'0d7ac3d39782c1755af2ce77a05f0e45bc60d20f';

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

/// See also [moduleDetail].
@ProviderFor(moduleDetail)
const moduleDetailProvider = ModuleDetailFamily();

/// See also [moduleDetail].
class ModuleDetailFamily extends Family<AsyncValue<Module>> {
  /// See also [moduleDetail].
  const ModuleDetailFamily();

  /// See also [moduleDetail].
  ModuleDetailProvider call({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) {
    return ModuleDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      moduleId: moduleId,
    );
  }

  @override
  ModuleDetailProvider getProviderOverride(
    covariant ModuleDetailProvider provider,
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
  String? get name => r'moduleDetailProvider';
}

/// See also [moduleDetail].
class ModuleDetailProvider extends AutoDisposeFutureProvider<Module> {
  /// See also [moduleDetail].
  ModuleDetailProvider({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) : this._internal(
         (ref) => moduleDetail(
           ref as ModuleDetailRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           moduleId: moduleId,
         ),
         from: moduleDetailProvider,
         name: r'moduleDetailProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$moduleDetailHash,
         dependencies: ModuleDetailFamily._dependencies,
         allTransitiveDependencies:
             ModuleDetailFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         moduleId: moduleId,
       );

  ModuleDetailProvider._internal(
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
    FutureOr<Module> Function(ModuleDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ModuleDetailProvider._internal(
        (ref) => create(ref as ModuleDetailRef),
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
  AutoDisposeFutureProviderElement<Module> createElement() {
    return _ModuleDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleDetailProvider &&
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
mixin ModuleDetailRef on AutoDisposeFutureProviderRef<Module> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `moduleId` of this provider.
  String get moduleId;
}

class _ModuleDetailProviderElement
    extends AutoDisposeFutureProviderElement<Module>
    with ModuleDetailRef {
  _ModuleDetailProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as ModuleDetailProvider).workspaceSlug;
  @override
  String get projectId => (origin as ModuleDetailProvider).projectId;
  @override
  String get moduleId => (origin as ModuleDetailProvider).moduleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
