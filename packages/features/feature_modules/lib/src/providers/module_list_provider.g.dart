// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moduleListHash() => r'688d58872ac0db7dc45862e3d69798745de24abb';

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

abstract class _$ModuleList
    extends BuildlessAutoDisposeAsyncNotifier<List<Module>> {
  late final String workspaceSlug;
  late final String projectId;

  FutureOr<List<Module>> build({
    required String workspaceSlug,
    required String projectId,
  });
}

/// See also [ModuleList].
@ProviderFor(ModuleList)
const moduleListProvider = ModuleListFamily();

/// See also [ModuleList].
class ModuleListFamily extends Family<AsyncValue<List<Module>>> {
  /// See also [ModuleList].
  const ModuleListFamily();

  /// See also [ModuleList].
  ModuleListProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return ModuleListProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  ModuleListProvider getProviderOverride(
    covariant ModuleListProvider provider,
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
  String? get name => r'moduleListProvider';
}

/// See also [ModuleList].
class ModuleListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ModuleList, List<Module>> {
  /// See also [ModuleList].
  ModuleListProvider({required String workspaceSlug, required String projectId})
    : this._internal(
        () => ModuleList()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId,
        from: moduleListProvider,
        name: r'moduleListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$moduleListHash,
        dependencies: ModuleListFamily._dependencies,
        allTransitiveDependencies: ModuleListFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
      );

  ModuleListProvider._internal(
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
  FutureOr<List<Module>> runNotifierBuild(covariant ModuleList notifier) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(ModuleList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ModuleListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ModuleList, List<Module>>
  createElement() {
    return _ModuleListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ModuleListProvider &&
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
mixin ModuleListRef on AutoDisposeAsyncNotifierProviderRef<List<Module>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _ModuleListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ModuleList, List<Module>>
    with ModuleListRef {
  _ModuleListProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as ModuleListProvider).workspaceSlug;
  @override
  String get projectId => (origin as ModuleListProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
