// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityHash() => r'bc5ac7cbbc66e8357ccb71af393503e9e7ca7874';

/// See also [connectivity].
@ProviderFor(connectivity)
final connectivityProvider = Provider<Connectivity>.internal(
  connectivity,
  name: r'connectivityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$connectivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityRef = ProviderRef<Connectivity>;
String _$syncQueueManagerHash() => r'7f3e51b2c08df2ca7ba4ff9a5bfd26aa4405cf4d';

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

/// See also [syncQueueManager].
@ProviderFor(syncQueueManager)
const syncQueueManagerProvider = SyncQueueManagerFamily();

/// See also [syncQueueManager].
class SyncQueueManagerFamily extends Family<SyncQueueManager> {
  /// See also [syncQueueManager].
  const SyncQueueManagerFamily();

  /// See also [syncQueueManager].
  SyncQueueManagerProvider call({required SyncQueueDao dao}) {
    return SyncQueueManagerProvider(dao: dao);
  }

  @override
  SyncQueueManagerProvider getProviderOverride(
    covariant SyncQueueManagerProvider provider,
  ) {
    return call(dao: provider.dao);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'syncQueueManagerProvider';
}

/// See also [syncQueueManager].
class SyncQueueManagerProvider extends Provider<SyncQueueManager> {
  /// See also [syncQueueManager].
  SyncQueueManagerProvider({required SyncQueueDao dao})
    : this._internal(
        (ref) => syncQueueManager(ref as SyncQueueManagerRef, dao: dao),
        from: syncQueueManagerProvider,
        name: r'syncQueueManagerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$syncQueueManagerHash,
        dependencies: SyncQueueManagerFamily._dependencies,
        allTransitiveDependencies:
            SyncQueueManagerFamily._allTransitiveDependencies,
        dao: dao,
      );

  SyncQueueManagerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dao,
  }) : super.internal();

  final SyncQueueDao dao;

  @override
  Override overrideWith(
    SyncQueueManager Function(SyncQueueManagerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SyncQueueManagerProvider._internal(
        (ref) => create(ref as SyncQueueManagerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dao: dao,
      ),
    );
  }

  @override
  ProviderElement<SyncQueueManager> createElement() {
    return _SyncQueueManagerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SyncQueueManagerProvider && other.dao == dao;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dao.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SyncQueueManagerRef on ProviderRef<SyncQueueManager> {
  /// The parameter `dao` of this provider.
  SyncQueueDao get dao;
}

class _SyncQueueManagerProviderElement extends ProviderElement<SyncQueueManager>
    with SyncQueueManagerRef {
  _SyncQueueManagerProviderElement(super.provider);

  @override
  SyncQueueDao get dao => (origin as SyncQueueManagerProvider).dao;
}

String _$conflictStoreHash() => r'37ee1b5b255963799c70f9c1f55d44bee7f3edca';

/// See also [conflictStore].
@ProviderFor(conflictStore)
final conflictStoreProvider = Provider<ConflictStore>.internal(
  conflictStore,
  name: r'conflictStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conflictStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConflictStoreRef = ProviderRef<ConflictStore>;
String _$conflictResolverHash() => r'3f75f8272df535d4b2ffd0142c5089ee45762622';

/// See also [conflictResolver].
@ProviderFor(conflictResolver)
final conflictResolverProvider = Provider<ConflictResolver>.internal(
  conflictResolver,
  name: r'conflictResolverProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conflictResolverHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConflictResolverRef = ProviderRef<ConflictResolver>;
String _$entitySyncHandlersHash() =>
    r'b00423e4bda64a03218d79812c262f304de98c48';

/// See also [entitySyncHandlers].
@ProviderFor(entitySyncHandlers)
const entitySyncHandlersProvider = EntitySyncHandlersFamily();

/// See also [entitySyncHandlers].
class EntitySyncHandlersFamily extends Family<Map<String, EntitySyncHandler>> {
  /// See also [entitySyncHandlers].
  const EntitySyncHandlersFamily();

  /// See also [entitySyncHandlers].
  EntitySyncHandlersProvider call({required PlaneApiClient apiClient}) {
    return EntitySyncHandlersProvider(apiClient: apiClient);
  }

  @override
  EntitySyncHandlersProvider getProviderOverride(
    covariant EntitySyncHandlersProvider provider,
  ) {
    return call(apiClient: provider.apiClient);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'entitySyncHandlersProvider';
}

/// See also [entitySyncHandlers].
class EntitySyncHandlersProvider
    extends Provider<Map<String, EntitySyncHandler>> {
  /// See also [entitySyncHandlers].
  EntitySyncHandlersProvider({required PlaneApiClient apiClient})
    : this._internal(
        (ref) => entitySyncHandlers(
          ref as EntitySyncHandlersRef,
          apiClient: apiClient,
        ),
        from: entitySyncHandlersProvider,
        name: r'entitySyncHandlersProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$entitySyncHandlersHash,
        dependencies: EntitySyncHandlersFamily._dependencies,
        allTransitiveDependencies:
            EntitySyncHandlersFamily._allTransitiveDependencies,
        apiClient: apiClient,
      );

  EntitySyncHandlersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.apiClient,
  }) : super.internal();

  final PlaneApiClient apiClient;

  @override
  Override overrideWith(
    Map<String, EntitySyncHandler> Function(EntitySyncHandlersRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EntitySyncHandlersProvider._internal(
        (ref) => create(ref as EntitySyncHandlersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        apiClient: apiClient,
      ),
    );
  }

  @override
  ProviderElement<Map<String, EntitySyncHandler>> createElement() {
    return _EntitySyncHandlersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EntitySyncHandlersProvider && other.apiClient == apiClient;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, apiClient.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EntitySyncHandlersRef on ProviderRef<Map<String, EntitySyncHandler>> {
  /// The parameter `apiClient` of this provider.
  PlaneApiClient get apiClient;
}

class _EntitySyncHandlersProviderElement
    extends ProviderElement<Map<String, EntitySyncHandler>>
    with EntitySyncHandlersRef {
  _EntitySyncHandlersProviderElement(super.provider);

  @override
  PlaneApiClient get apiClient =>
      (origin as EntitySyncHandlersProvider).apiClient;
}

String _$syncEngineHash() => r'f5256839b612d1168f15204682b3a21c17b6c423';

/// See also [syncEngine].
@ProviderFor(syncEngine)
const syncEngineProvider = SyncEngineFamily();

/// See also [syncEngine].
class SyncEngineFamily extends Family<SyncEngine> {
  /// See also [syncEngine].
  const SyncEngineFamily();

  /// See also [syncEngine].
  SyncEngineProvider call({
    required SyncQueueDao dao,
    required PlaneApiClient apiClient,
  }) {
    return SyncEngineProvider(dao: dao, apiClient: apiClient);
  }

  @override
  SyncEngineProvider getProviderOverride(
    covariant SyncEngineProvider provider,
  ) {
    return call(dao: provider.dao, apiClient: provider.apiClient);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'syncEngineProvider';
}

/// See also [syncEngine].
class SyncEngineProvider extends Provider<SyncEngine> {
  /// See also [syncEngine].
  SyncEngineProvider({
    required SyncQueueDao dao,
    required PlaneApiClient apiClient,
  }) : this._internal(
         (ref) =>
             syncEngine(ref as SyncEngineRef, dao: dao, apiClient: apiClient),
         from: syncEngineProvider,
         name: r'syncEngineProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$syncEngineHash,
         dependencies: SyncEngineFamily._dependencies,
         allTransitiveDependencies: SyncEngineFamily._allTransitiveDependencies,
         dao: dao,
         apiClient: apiClient,
       );

  SyncEngineProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dao,
    required this.apiClient,
  }) : super.internal();

  final SyncQueueDao dao;
  final PlaneApiClient apiClient;

  @override
  Override overrideWith(SyncEngine Function(SyncEngineRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SyncEngineProvider._internal(
        (ref) => create(ref as SyncEngineRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dao: dao,
        apiClient: apiClient,
      ),
    );
  }

  @override
  ProviderElement<SyncEngine> createElement() {
    return _SyncEngineProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SyncEngineProvider &&
        other.dao == dao &&
        other.apiClient == apiClient;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dao.hashCode);
    hash = _SystemHash.combine(hash, apiClient.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SyncEngineRef on ProviderRef<SyncEngine> {
  /// The parameter `dao` of this provider.
  SyncQueueDao get dao;

  /// The parameter `apiClient` of this provider.
  PlaneApiClient get apiClient;
}

class _SyncEngineProviderElement extends ProviderElement<SyncEngine>
    with SyncEngineRef {
  _SyncEngineProviderElement(super.provider);

  @override
  SyncQueueDao get dao => (origin as SyncEngineProvider).dao;
  @override
  PlaneApiClient get apiClient => (origin as SyncEngineProvider).apiClient;
}

String _$syncStatusHash() => r'096f2c5aa73aa05113159301fea2c65db20ae13f';

/// See also [syncStatus].
@ProviderFor(syncStatus)
const syncStatusProvider = SyncStatusFamily();

/// See also [syncStatus].
class SyncStatusFamily extends Family<AsyncValue<SyncStatus>> {
  /// See also [syncStatus].
  const SyncStatusFamily();

  /// See also [syncStatus].
  SyncStatusProvider call({
    required SyncQueueDao dao,
    required PlaneApiClient apiClient,
  }) {
    return SyncStatusProvider(dao: dao, apiClient: apiClient);
  }

  @override
  SyncStatusProvider getProviderOverride(
    covariant SyncStatusProvider provider,
  ) {
    return call(dao: provider.dao, apiClient: provider.apiClient);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'syncStatusProvider';
}

/// See also [syncStatus].
class SyncStatusProvider extends AutoDisposeStreamProvider<SyncStatus> {
  /// See also [syncStatus].
  SyncStatusProvider({
    required SyncQueueDao dao,
    required PlaneApiClient apiClient,
  }) : this._internal(
         (ref) =>
             syncStatus(ref as SyncStatusRef, dao: dao, apiClient: apiClient),
         from: syncStatusProvider,
         name: r'syncStatusProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$syncStatusHash,
         dependencies: SyncStatusFamily._dependencies,
         allTransitiveDependencies: SyncStatusFamily._allTransitiveDependencies,
         dao: dao,
         apiClient: apiClient,
       );

  SyncStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dao,
    required this.apiClient,
  }) : super.internal();

  final SyncQueueDao dao;
  final PlaneApiClient apiClient;

  @override
  Override overrideWith(
    Stream<SyncStatus> Function(SyncStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SyncStatusProvider._internal(
        (ref) => create(ref as SyncStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dao: dao,
        apiClient: apiClient,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<SyncStatus> createElement() {
    return _SyncStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SyncStatusProvider &&
        other.dao == dao &&
        other.apiClient == apiClient;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dao.hashCode);
    hash = _SystemHash.combine(hash, apiClient.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SyncStatusRef on AutoDisposeStreamProviderRef<SyncStatus> {
  /// The parameter `dao` of this provider.
  SyncQueueDao get dao;

  /// The parameter `apiClient` of this provider.
  PlaneApiClient get apiClient;
}

class _SyncStatusProviderElement
    extends AutoDisposeStreamProviderElement<SyncStatus>
    with SyncStatusRef {
  _SyncStatusProviderElement(super.provider);

  @override
  SyncQueueDao get dao => (origin as SyncStatusProvider).dao;
  @override
  PlaneApiClient get apiClient => (origin as SyncStatusProvider).apiClient;
}

String _$pendingSyncCountHash() => r'bbf48ba6eccae9d160aa5e375b108849231a3493';

/// See also [pendingSyncCount].
@ProviderFor(pendingSyncCount)
const pendingSyncCountProvider = PendingSyncCountFamily();

/// See also [pendingSyncCount].
class PendingSyncCountFamily extends Family<AsyncValue<int>> {
  /// See also [pendingSyncCount].
  const PendingSyncCountFamily();

  /// See also [pendingSyncCount].
  PendingSyncCountProvider call({required SyncQueueDao dao}) {
    return PendingSyncCountProvider(dao: dao);
  }

  @override
  PendingSyncCountProvider getProviderOverride(
    covariant PendingSyncCountProvider provider,
  ) {
    return call(dao: provider.dao);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pendingSyncCountProvider';
}

/// See also [pendingSyncCount].
class PendingSyncCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [pendingSyncCount].
  PendingSyncCountProvider({required SyncQueueDao dao})
    : this._internal(
        (ref) => pendingSyncCount(ref as PendingSyncCountRef, dao: dao),
        from: pendingSyncCountProvider,
        name: r'pendingSyncCountProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pendingSyncCountHash,
        dependencies: PendingSyncCountFamily._dependencies,
        allTransitiveDependencies:
            PendingSyncCountFamily._allTransitiveDependencies,
        dao: dao,
      );

  PendingSyncCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dao,
  }) : super.internal();

  final SyncQueueDao dao;

  @override
  Override overrideWith(
    FutureOr<int> Function(PendingSyncCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PendingSyncCountProvider._internal(
        (ref) => create(ref as PendingSyncCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dao: dao,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _PendingSyncCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PendingSyncCountProvider && other.dao == dao;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dao.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PendingSyncCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `dao` of this provider.
  SyncQueueDao get dao;
}

class _PendingSyncCountProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with PendingSyncCountRef {
  _PendingSyncCountProviderElement(super.provider);

  @override
  SyncQueueDao get dao => (origin as PendingSyncCountProvider).dao;
}

String _$unresolvedConflictsHash() =>
    r'fa69b088a7206ccff65bff76842d1f95339cd5b6';

/// See also [unresolvedConflicts].
@ProviderFor(unresolvedConflicts)
final unresolvedConflictsProvider =
    AutoDisposeStreamProvider<List<SyncConflict>>.internal(
      unresolvedConflicts,
      name: r'unresolvedConflictsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$unresolvedConflictsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnresolvedConflictsRef =
    AutoDisposeStreamProviderRef<List<SyncConflict>>;
String _$syncSettingsHash() => r'1031f2fee261b4868728d3d2a7f91118d2b8c359';

/// See also [SyncSettings].
@ProviderFor(SyncSettings)
final syncSettingsProvider =
    AutoDisposeNotifierProvider<SyncSettings, ConflictStrategy>.internal(
      SyncSettings.new,
      name: r'syncSettingsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$syncSettingsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SyncSettings = AutoDisposeNotifier<ConflictStrategy>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
