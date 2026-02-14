// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredNotificationsHash() =>
    r'bffa47eeb8e573384a503e4e70e8d00bfa1048fd';

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

/// See also [filteredNotifications].
@ProviderFor(filteredNotifications)
const filteredNotificationsProvider = FilteredNotificationsFamily();

/// See also [filteredNotifications].
class FilteredNotificationsFamily
    extends Family<AsyncValue<List<PlaneNotification>>> {
  /// See also [filteredNotifications].
  const FilteredNotificationsFamily();

  /// See also [filteredNotifications].
  FilteredNotificationsProvider call({required String workspaceSlug}) {
    return FilteredNotificationsProvider(workspaceSlug: workspaceSlug);
  }

  @override
  FilteredNotificationsProvider getProviderOverride(
    covariant FilteredNotificationsProvider provider,
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
  String? get name => r'filteredNotificationsProvider';
}

/// See also [filteredNotifications].
class FilteredNotificationsProvider
    extends AutoDisposeFutureProvider<List<PlaneNotification>> {
  /// See also [filteredNotifications].
  FilteredNotificationsProvider({required String workspaceSlug})
    : this._internal(
        (ref) => filteredNotifications(
          ref as FilteredNotificationsRef,
          workspaceSlug: workspaceSlug,
        ),
        from: filteredNotificationsProvider,
        name: r'filteredNotificationsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$filteredNotificationsHash,
        dependencies: FilteredNotificationsFamily._dependencies,
        allTransitiveDependencies:
            FilteredNotificationsFamily._allTransitiveDependencies,
        workspaceSlug: workspaceSlug,
      );

  FilteredNotificationsProvider._internal(
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
    FutureOr<List<PlaneNotification>> Function(
      FilteredNotificationsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredNotificationsProvider._internal(
        (ref) => create(ref as FilteredNotificationsRef),
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
  AutoDisposeFutureProviderElement<List<PlaneNotification>> createElement() {
    return _FilteredNotificationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredNotificationsProvider &&
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
mixin FilteredNotificationsRef
    on AutoDisposeFutureProviderRef<List<PlaneNotification>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;
}

class _FilteredNotificationsProviderElement
    extends AutoDisposeFutureProviderElement<List<PlaneNotification>>
    with FilteredNotificationsRef {
  _FilteredNotificationsProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as FilteredNotificationsProvider).workspaceSlug;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
