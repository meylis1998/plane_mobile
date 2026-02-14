// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredProjectsHash() => r'6697d432611ff66fceeffeade508935963d2cb13';

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

/// Returns a filtered project list based on the search query.
///
/// Copied from [filteredProjects].
@ProviderFor(filteredProjects)
const filteredProjectsProvider = FilteredProjectsFamily();

/// Returns a filtered project list based on the search query.
///
/// Copied from [filteredProjects].
class FilteredProjectsFamily extends Family<AsyncValue<List<Project>>> {
  /// Returns a filtered project list based on the search query.
  ///
  /// Copied from [filteredProjects].
  const FilteredProjectsFamily();

  /// Returns a filtered project list based on the search query.
  ///
  /// Copied from [filteredProjects].
  FilteredProjectsProvider call({required String workspaceSlug}) {
    return FilteredProjectsProvider(workspaceSlug: workspaceSlug);
  }

  @override
  FilteredProjectsProvider getProviderOverride(
    covariant FilteredProjectsProvider provider,
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
  String? get name => r'filteredProjectsProvider';
}

/// Returns a filtered project list based on the search query.
///
/// Copied from [filteredProjects].
class FilteredProjectsProvider
    extends AutoDisposeFutureProvider<List<Project>> {
  /// Returns a filtered project list based on the search query.
  ///
  /// Copied from [filteredProjects].
  FilteredProjectsProvider({required String workspaceSlug})
    : this._internal(
        (ref) => filteredProjects(
          ref as FilteredProjectsRef,
          workspaceSlug: workspaceSlug,
        ),
        from: filteredProjectsProvider,
        name: r'filteredProjectsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$filteredProjectsHash,
        dependencies: FilteredProjectsFamily._dependencies,
        allTransitiveDependencies:
            FilteredProjectsFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  FilteredProjectsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Project>> Function(FilteredProjectsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredProjectsProvider._internal(
        (ref) => create(ref as FilteredProjectsRef),
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
  AutoDisposeFutureProviderElement<List<Project>> createElement() {
    return _FilteredProjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredProjectsProvider &&
        other.workspaceSlug == workspaceSlug;
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
mixin FilteredProjectsRef on AutoDisposeFutureProviderRef<List<Project>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _FilteredProjectsProviderElement
    extends AutoDisposeFutureProviderElement<List<Project>>
    with FilteredProjectsRef {
  _FilteredProjectsProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as FilteredProjectsProvider).workspaceSlug;
}

String _$projectSearchQueryHash() =>
    r'977465ad2cd271bccc3c650ed4db29674121f23d';

/// Holds the current search query for the project list.
///
/// Copied from [ProjectSearchQuery].
@ProviderFor(ProjectSearchQuery)
final projectSearchQueryProvider =
    AutoDisposeNotifierProvider<ProjectSearchQuery, String>.internal(
      ProjectSearchQuery.new,
      name: r'projectSearchQueryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$projectSearchQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProjectSearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
