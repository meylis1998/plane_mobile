// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workspaceDetailHash() => r'7f1b2e39d4f40961b67356f17f697a793bc99f32';

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

/// See also [workspaceDetail].
@ProviderFor(workspaceDetail)
const workspaceDetailProvider = WorkspaceDetailFamily();

/// See also [workspaceDetail].
class WorkspaceDetailFamily extends Family<AsyncValue<Workspace>> {
  /// See also [workspaceDetail].
  const WorkspaceDetailFamily();

  /// See also [workspaceDetail].
  WorkspaceDetailProvider call({required String slug}) {
    return WorkspaceDetailProvider(slug: slug);
  }

  @override
  WorkspaceDetailProvider getProviderOverride(
    covariant WorkspaceDetailProvider provider,
  ) {
    return call(slug: provider.slug);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workspaceDetailProvider';
}

/// See also [workspaceDetail].
class WorkspaceDetailProvider extends AutoDisposeFutureProvider<Workspace> {
  /// See also [workspaceDetail].
  WorkspaceDetailProvider({required String slug})
    : this._internal(
        (ref) => workspaceDetail(ref as WorkspaceDetailRef, slug: slug),
        from: workspaceDetailProvider,
        name: r'workspaceDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$workspaceDetailHash,
        dependencies: WorkspaceDetailFamily._dependencies,
        allTransitiveDependencies:
            WorkspaceDetailFamily._allTransitiveDependencies,
        slug: slug,
      );

  WorkspaceDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  Override overrideWith(
    FutureOr<Workspace> Function(WorkspaceDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkspaceDetailProvider._internal(
        (ref) => create(ref as WorkspaceDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Workspace> createElement() {
    return _WorkspaceDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkspaceDetailProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WorkspaceDetailRef on AutoDisposeFutureProviderRef<Workspace> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _WorkspaceDetailProviderElement
    extends AutoDisposeFutureProviderElement<Workspace>
    with WorkspaceDetailRef {
  _WorkspaceDetailProviderElement(super.provider);

  @override
  String get slug => (origin as WorkspaceDetailProvider).slug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
