// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_cycles_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredCyclesHash() => r'9a5540a86927b201f2d34cf565a0eca88d02ed39';

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

/// See also [filteredCycles].
@ProviderFor(filteredCycles)
const filteredCyclesProvider = FilteredCyclesFamily();

/// See also [filteredCycles].
class FilteredCyclesFamily extends Family<AsyncValue<List<Cycle>>> {
  /// See also [filteredCycles].
  const FilteredCyclesFamily();

  /// See also [filteredCycles].
  FilteredCyclesProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return FilteredCyclesProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  FilteredCyclesProvider getProviderOverride(
    covariant FilteredCyclesProvider provider,
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
  String? get name => r'filteredCyclesProvider';
}

/// See also [filteredCycles].
class FilteredCyclesProvider extends AutoDisposeFutureProvider<List<Cycle>> {
  /// See also [filteredCycles].
  FilteredCyclesProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => filteredCycles(
           ref as FilteredCyclesRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: filteredCyclesProvider,
         name: r'filteredCyclesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$filteredCyclesHash,
         dependencies: FilteredCyclesFamily._dependencies,
         allTransitiveDependencies:
             FilteredCyclesFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  FilteredCyclesProvider._internal(
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
    FutureOr<List<Cycle>> Function(FilteredCyclesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredCyclesProvider._internal(
        (ref) => create(ref as FilteredCyclesRef),
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
  AutoDisposeFutureProviderElement<List<Cycle>> createElement() {
    return _FilteredCyclesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredCyclesProvider &&
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
mixin FilteredCyclesRef on AutoDisposeFutureProviderRef<List<Cycle>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _FilteredCyclesProviderElement
    extends AutoDisposeFutureProviderElement<List<Cycle>>
    with FilteredCyclesRef {
  _FilteredCyclesProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as FilteredCyclesProvider).workspaceSlug;
  @override
  String get projectId => (origin as FilteredCyclesProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
