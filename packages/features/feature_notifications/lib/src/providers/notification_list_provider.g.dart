// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationListHash() => r'f7161894dece1c9f45eeeff5200ffec4db911868';

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

abstract class _$NotificationList
    extends BuildlessAutoDisposeAsyncNotifier<List<PlaneNotification>> {
  late final String workspaceSlug;

  FutureOr<List<PlaneNotification>> build({required String workspaceSlug});
}

/// See also [NotificationList].
@ProviderFor(NotificationList)
const notificationListProvider = NotificationListFamily();

/// See also [NotificationList].
class NotificationListFamily
    extends Family<AsyncValue<List<PlaneNotification>>> {
  /// See also [NotificationList].
  const NotificationListFamily();

  /// See also [NotificationList].
  NotificationListProvider call({required String workspaceSlug}) {
    return NotificationListProvider(workspaceSlug: workspaceSlug);
  }

  @override
  NotificationListProvider getProviderOverride(
    covariant NotificationListProvider provider,
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
  String? get name => r'notificationListProvider';
}

/// See also [NotificationList].
class NotificationListProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          NotificationList,
          List<PlaneNotification>
        > {
  /// See also [NotificationList].
  NotificationListProvider({required String workspaceSlug})
    : this._internal(
        () => NotificationList()..workspaceSlug = workspaceSlug,
        from: notificationListProvider,
        name: r'notificationListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$notificationListHash,
        dependencies: NotificationListFamily._dependencies,
        allTransitiveDependencies:
            NotificationListFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  NotificationListProvider._internal(
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
  FutureOr<List<PlaneNotification>> runNotifierBuild(
    covariant NotificationList notifier,
  ) {
    return notifier.build(workspaceSlug: workspaceSlug);
  }

  @override
  Override overrideWith(NotificationList Function() create) {
    return ProviderOverride(
      origin: this,
      override: NotificationListProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<
    NotificationList,
    List<PlaneNotification>
  >
  createElement() {
    return _NotificationListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationListProvider &&
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
mixin NotificationListRef
    on AutoDisposeAsyncNotifierProviderRef<List<PlaneNotification>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _NotificationListProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          NotificationList,
          List<PlaneNotification>
        >
    with NotificationListRef {
  _NotificationListProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as NotificationListProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
