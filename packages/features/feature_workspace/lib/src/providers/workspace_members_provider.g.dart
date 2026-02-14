// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_members_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workspaceMembersHash() => r'f023bdea3d182fbf3400138a1595dbc08a75c8cd';

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

/// Provider that exposes a list of workspace members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the workspace API to fetch members.
///
/// Copied from [workspaceMembers].
@ProviderFor(workspaceMembers)
const workspaceMembersProvider = WorkspaceMembersFamily();

/// Provider that exposes a list of workspace members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the workspace API to fetch members.
///
/// Copied from [workspaceMembers].
class WorkspaceMembersFamily extends Family<AsyncValue<List<Member>>> {
  /// Provider that exposes a list of workspace members.
  ///
  /// Currently returns an empty stub list. The real implementation
  /// will call the workspace API to fetch members.
  ///
  /// Copied from [workspaceMembers].
  const WorkspaceMembersFamily();

  /// Provider that exposes a list of workspace members.
  ///
  /// Currently returns an empty stub list. The real implementation
  /// will call the workspace API to fetch members.
  ///
  /// Copied from [workspaceMembers].
  WorkspaceMembersProvider call({required String workspaceSlug}) {
    return WorkspaceMembersProvider(workspaceSlug: workspaceSlug);
  }

  @override
  WorkspaceMembersProvider getProviderOverride(
    covariant WorkspaceMembersProvider provider,
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
  String? get name => r'workspaceMembersProvider';
}

/// Provider that exposes a list of workspace members.
///
/// Currently returns an empty stub list. The real implementation
/// will call the workspace API to fetch members.
///
/// Copied from [workspaceMembers].
class WorkspaceMembersProvider extends AutoDisposeFutureProvider<List<Member>> {
  /// Provider that exposes a list of workspace members.
  ///
  /// Currently returns an empty stub list. The real implementation
  /// will call the workspace API to fetch members.
  ///
  /// Copied from [workspaceMembers].
  WorkspaceMembersProvider({required String workspaceSlug})
    : this._internal(
        (ref) => workspaceMembers(
          ref as WorkspaceMembersRef,
          workspaceSlug: workspaceSlug,
        ),
        from: workspaceMembersProvider,
        name: r'workspaceMembersProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$workspaceMembersHash,
        dependencies: WorkspaceMembersFamily._dependencies,
        allTransitiveDependencies:
            WorkspaceMembersFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  WorkspaceMembersProvider._internal(
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
    FutureOr<List<Member>> Function(WorkspaceMembersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkspaceMembersProvider._internal(
        (ref) => create(ref as WorkspaceMembersRef),
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
  AutoDisposeFutureProviderElement<List<Member>> createElement() {
    return _WorkspaceMembersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkspaceMembersProvider &&
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
mixin WorkspaceMembersRef on AutoDisposeFutureProviderRef<List<Member>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _WorkspaceMembersProviderElement
    extends AutoDisposeFutureProviderElement<List<Member>>
    with WorkspaceMembersRef {
  _WorkspaceMembersProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as WorkspaceMembersProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
