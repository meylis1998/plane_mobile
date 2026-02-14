// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webSocketClientHash() => r'a76cd96c01410d003809b1f4ec65c86d76287dbe';

/// Provides the singleton [PlaneWebSocketClient].
///
/// Copied from [webSocketClient].
@ProviderFor(webSocketClient)
final webSocketClientProvider = Provider<PlaneWebSocketClient>.internal(
  webSocketClient,
  name: r'webSocketClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$webSocketClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WebSocketClientRef = ProviderRef<PlaneWebSocketClient>;
String _$planeEventHandlerHash() => r'4fdb6032725014bf61955757689026ef25dc5a30';

/// Provides the singleton [PlaneEventHandler] wired to the WebSocket client.
///
/// Copied from [planeEventHandler].
@ProviderFor(planeEventHandler)
final planeEventHandlerProvider = Provider<PlaneEventHandler>.internal(
  planeEventHandler,
  name: r'planeEventHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$planeEventHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlaneEventHandlerRef = ProviderRef<PlaneEventHandler>;
String _$liveUpdateServiceHash() => r'934b3df5dea1e6c438b9f347a075ac9b9b473d97';

/// Provides the singleton [LiveUpdateService].
///
/// Copied from [liveUpdateService].
@ProviderFor(liveUpdateService)
final liveUpdateServiceProvider = Provider<LiveUpdateService>.internal(
  liveUpdateService,
  name: r'liveUpdateServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$liveUpdateServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LiveUpdateServiceRef = ProviderRef<LiveUpdateService>;
String _$connectionStateHash() => r'1f644474807b24dd99c00d0c4b19a5148481d23a';

/// Stream provider for WebSocket connection state changes.
///
/// Copied from [connectionState].
@ProviderFor(connectionState)
final connectionStateProvider =
    AutoDisposeStreamProvider<realtime.ConnectionState>.internal(
      connectionState,
      name: r'connectionStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$connectionStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectionStateRef =
    AutoDisposeStreamProviderRef<realtime.ConnectionState>;
String _$hocuspocusClientHash() => r'1efc61cd7cbfe36e3291844c706e1decef072706';

/// Provides the [HocuspocusClient] for document collaboration.
///
/// Copied from [hocuspocusClient].
@ProviderFor(hocuspocusClient)
final hocuspocusClientProvider = Provider<HocuspocusClient>.internal(
  hocuspocusClient,
  name: r'hocuspocusClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hocuspocusClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HocuspocusClientRef = ProviderRef<HocuspocusClient>;
String _$presenceHash() => r'c94b98648ecc9a5dec467f458cd7f9a668c55fe1';

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

abstract class _$Presence
    extends BuildlessAutoDisposeNotifier<Map<String, PresenceStatus>> {
  late final String workspaceSlug;

  Map<String, PresenceStatus> build({required String workspaceSlug});
}

/// Tracks per-workspace online presence information.
///
/// Copied from [Presence].
@ProviderFor(Presence)
const presenceProvider = PresenceFamily();

/// Tracks per-workspace online presence information.
///
/// Copied from [Presence].
class PresenceFamily extends Family<Map<String, PresenceStatus>> {
  /// Tracks per-workspace online presence information.
  ///
  /// Copied from [Presence].
  const PresenceFamily();

  /// Tracks per-workspace online presence information.
  ///
  /// Copied from [Presence].
  PresenceProvider call({required String workspaceSlug}) {
    return PresenceProvider(workspaceSlug: workspaceSlug);
  }

  @override
  PresenceProvider getProviderOverride(covariant PresenceProvider provider) {
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
  String? get name => r'presenceProvider';
}

/// Tracks per-workspace online presence information.
///
/// Copied from [Presence].
class PresenceProvider
    extends
        AutoDisposeNotifierProviderImpl<Presence, Map<String, PresenceStatus>> {
  /// Tracks per-workspace online presence information.
  ///
  /// Copied from [Presence].
  PresenceProvider({required String workspaceSlug})
    : this._internal(
        () => Presence()..workspaceSlug = workspaceSlug,
        from: presenceProvider,
        name: r'presenceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$presenceHash,
        dependencies: PresenceFamily._dependencies,
        allTransitiveDependencies: PresenceFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  PresenceProvider._internal(
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
  Map<String, PresenceStatus> runNotifierBuild(covariant Presence notifier) {
    return notifier.build(workspaceSlug: workspaceSlug);
  }

  @override
  Override overrideWith(Presence Function() create) {
    return ProviderOverride(
      origin: this,
      override: PresenceProvider._internal(
        () => create()..workspaceSlug = workspaceSlug,
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
  AutoDisposeNotifierProviderElement<Presence, Map<String, PresenceStatus>>
  createElement() {
    return _PresenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PresenceProvider && other.workspaceSlug == workspaceSlug;
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
mixin PresenceRef
    on AutoDisposeNotifierProviderRef<Map<String, PresenceStatus>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _PresenceProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          Presence,
          Map<String, PresenceStatus>
        >
    with PresenceRef {
  _PresenceProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as PresenceProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
