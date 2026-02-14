// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unreadCountHash() => r'489d18fbe576c0149e6b92c7dfb959ba3032b82c';

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

/// See also [unreadCount].
@ProviderFor(unreadCount)
const unreadCountProvider = UnreadCountFamily();

/// See also [unreadCount].
class UnreadCountFamily extends Family<int> {
  /// See also [unreadCount].
  const UnreadCountFamily();

  /// See also [unreadCount].
  UnreadCountProvider call({required String workspaceSlug}) {
    return UnreadCountProvider(workspaceSlug: workspaceSlug);
  }

  @override
  UnreadCountProvider getProviderOverride(
    covariant UnreadCountProvider provider,
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
  String? get name => r'unreadCountProvider';
}

/// See also [unreadCount].
class UnreadCountProvider extends AutoDisposeProvider<int> {
  /// See also [unreadCount].
  UnreadCountProvider({required String workspaceSlug})
    : this._internal(
        (ref) =>
            unreadCount(ref as UnreadCountRef, workspaceSlug: workspaceSlug),
        from: unreadCountProvider,
        name: r'unreadCountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$unreadCountHash,
        dependencies: UnreadCountFamily._dependencies,
        allTransitiveDependencies: UnreadCountFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  UnreadCountProvider._internal(
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
  Override overrideWith(int Function(UnreadCountRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: UnreadCountProvider._internal(
        (ref) => create(ref as UnreadCountRef),
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
  AutoDisposeProviderElement<int> createElement() {
    return _UnreadCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UnreadCountProvider && other.workspaceSlug == workspaceSlug;
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
mixin UnreadCountRef on AutoDisposeProviderRef<int> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _UnreadCountProviderElement extends AutoDisposeProviderElement<int>
    with UnreadCountRef {
  _UnreadCountProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as UnreadCountProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
