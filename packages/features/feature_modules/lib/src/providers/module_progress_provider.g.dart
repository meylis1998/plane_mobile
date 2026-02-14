// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moduleProgressHash() => r'4ec8537c46436a4e02adbf2b2a3b4614995e8968';

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

/// See also [moduleProgress].
@ProviderFor(moduleProgress)
const moduleProgressProvider = ModuleProgressFamily();

/// See also [moduleProgress].
class ModuleProgressFamily extends Family<AsyncValue<ModuleProgress>> {
  /// See also [moduleProgress].
  const ModuleProgressFamily();

  /// See also [moduleProgress].
  ModuleProgressProvider call({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) {
    return ModuleProgressProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      moduleId: moduleId,
    );
  }

  @override
  ModuleProgressProvider getProviderOverride(
    covariant ModuleProgressProvider provider,
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
  String? get name => r'moduleProgressProvider';
}

/// See also [moduleProgress].
class ModuleProgressProvider extends AutoDisposeFutureProvider<ModuleProgress> {
  /// See also [moduleProgress].
  ModuleProgressProvider({
    required String workspaceSlug,
    required String projectId,
    required String moduleId,
  }) : this._internal(
         (ref) => moduleProgress(
           ref as ModuleProgressRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
           moduleId: moduleId,
         ),
         from: moduleProgressProvider,
         name: r'moduleProgressProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$moduleProgressHash,
         dependencies: ModuleProgressFamily._dependencies,
         allTransitiveDependencies:
             ModuleProgressFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         moduleId: moduleId,
       );

  ModuleProgressProvider._internal(
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
    FutureOr<ModuleProgress> Function(ModuleProgressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ModuleProgressProvider._internal(
        (ref) => create(ref as ModuleProgressRef),
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
  AutoDisposeFutureProviderElement<ModuleProgress> createElement() {
    return _ModuleProgressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleProgressProvider &&
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
mixin ModuleProgressRef on AutoDisposeFutureProviderRef<ModuleProgress> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `moduleId` of this provider.
  String get moduleId;
}

class _ModuleProgressProviderElement
    extends AutoDisposeFutureProviderElement<ModuleProgress>
    with ModuleProgressRef {
  _ModuleProgressProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as ModuleProgressProvider).workspaceSlug;
  @override
  String get projectId => (origin as ModuleProgressProvider).projectId;
  @override
  String get moduleId => (origin as ModuleProgressProvider).moduleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
