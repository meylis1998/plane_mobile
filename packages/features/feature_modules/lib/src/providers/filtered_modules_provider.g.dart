// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_modules_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredModulesHash() => r'4d4615612b0593ba193b3c0c087ac9870d51b408';

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

/// See also [filteredModules].
@ProviderFor(filteredModules)
const filteredModulesProvider = FilteredModulesFamily();

/// See also [filteredModules].
class FilteredModulesFamily extends Family<AsyncValue<List<Module>>> {
  /// See also [filteredModules].
  const FilteredModulesFamily();

  /// See also [filteredModules].
  FilteredModulesProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return FilteredModulesProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  FilteredModulesProvider getProviderOverride(
    covariant FilteredModulesProvider provider,
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
  String? get name => r'filteredModulesProvider';
}

/// See also [filteredModules].
class FilteredModulesProvider extends AutoDisposeFutureProvider<List<Module>> {
  /// See also [filteredModules].
  FilteredModulesProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => filteredModules(
           ref as FilteredModulesRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: filteredModulesProvider,
         name: r'filteredModulesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$filteredModulesHash,
         dependencies: FilteredModulesFamily._dependencies,
         allTransitiveDependencies:
             FilteredModulesFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  FilteredModulesProvider._internal(
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
    FutureOr<List<Module>> Function(FilteredModulesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredModulesProvider._internal(
        (ref) => create(ref as FilteredModulesRef),
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
  AutoDisposeFutureProviderElement<List<Module>> createElement() {
    return _FilteredModulesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredModulesProvider &&
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
mixin FilteredModulesRef on AutoDisposeFutureProviderRef<List<Module>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _FilteredModulesProviderElement
    extends AutoDisposeFutureProviderElement<List<Module>>
    with FilteredModulesRef {
  _FilteredModulesProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as FilteredModulesProvider).workspaceSlug;
  @override
  String get projectId => (origin as FilteredModulesProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
