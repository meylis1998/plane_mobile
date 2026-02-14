// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_projects_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteProjectsHash() => r'c05714a12153633c852d0cae337679cc0cafbb38';

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

/// See also [favoriteProjects].
@ProviderFor(favoriteProjects)
const favoriteProjectsProvider = FavoriteProjectsFamily();

/// See also [favoriteProjects].
class FavoriteProjectsFamily extends Family<AsyncValue<List<Project>>> {
  /// See also [favoriteProjects].
  const FavoriteProjectsFamily();

  /// See also [favoriteProjects].
  FavoriteProjectsProvider call({required String workspaceSlug}) {
    return FavoriteProjectsProvider(workspaceSlug: workspaceSlug);
  }

  @override
  FavoriteProjectsProvider getProviderOverride(
    covariant FavoriteProjectsProvider provider,
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
  String? get name => r'favoriteProjectsProvider';
}

/// See also [favoriteProjects].
class FavoriteProjectsProvider
    extends AutoDisposeFutureProvider<List<Project>> {
  /// See also [favoriteProjects].
  FavoriteProjectsProvider({required String workspaceSlug})
    : this._internal(
        (ref) => favoriteProjects(
          ref as FavoriteProjectsRef,
          workspaceSlug: workspaceSlug,
        ),
        from: favoriteProjectsProvider,
        name: r'favoriteProjectsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$favoriteProjectsHash,
        dependencies: FavoriteProjectsFamily._dependencies,
        allTransitiveDependencies:
            FavoriteProjectsFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  FavoriteProjectsProvider._internal(
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
    FutureOr<List<Project>> Function(FavoriteProjectsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FavoriteProjectsProvider._internal(
        (ref) => create(ref as FavoriteProjectsRef),
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
    return _FavoriteProjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteProjectsProvider &&
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
mixin FavoriteProjectsRef on AutoDisposeFutureProviderRef<List<Project>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _FavoriteProjectsProviderElement
    extends AutoDisposeFutureProviderElement<List<Project>>
    with FavoriteProjectsRef {
  _FavoriteProjectsProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as FavoriteProjectsProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
