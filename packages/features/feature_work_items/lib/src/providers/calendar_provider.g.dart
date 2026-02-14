// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workItemsByDateHash() => r'59a4b6008edf46e0183aba9ade7fd0081496b638';

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

/// See also [workItemsByDate].
@ProviderFor(workItemsByDate)
const workItemsByDateProvider = WorkItemsByDateFamily();

/// See also [workItemsByDate].
class WorkItemsByDateFamily
    extends Family<AsyncValue<Map<DateTime, List<WorkItem>>>> {
  /// See also [workItemsByDate].
  const WorkItemsByDateFamily();

  /// See also [workItemsByDate].
  WorkItemsByDateProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return WorkItemsByDateProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  WorkItemsByDateProvider getProviderOverride(
    covariant WorkItemsByDateProvider provider,
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
  String? get name => r'workItemsByDateProvider';
}

/// See also [workItemsByDate].
class WorkItemsByDateProvider
    extends AutoDisposeFutureProvider<Map<DateTime, List<WorkItem>>> {
  /// See also [workItemsByDate].
  WorkItemsByDateProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         (ref) => workItemsByDate(
           ref as WorkItemsByDateRef,
           workspaceSlug: workspaceSlug,
           projectId: projectId,
         ),
         from: workItemsByDateProvider,
         name: r'workItemsByDateProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$workItemsByDateHash,
         dependencies: WorkItemsByDateFamily._dependencies,
         allTransitiveDependencies:
             WorkItemsByDateFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  WorkItemsByDateProvider._internal(
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
    FutureOr<Map<DateTime, List<WorkItem>>> Function(
      WorkItemsByDateRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorkItemsByDateProvider._internal(
        (ref) => create(ref as WorkItemsByDateRef),
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
  AutoDisposeFutureProviderElement<Map<DateTime, List<WorkItem>>>
  createElement() {
    return _WorkItemsByDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkItemsByDateProvider &&
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
mixin WorkItemsByDateRef
    on AutoDisposeFutureProviderRef<Map<DateTime, List<WorkItem>>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _WorkItemsByDateProviderElement
    extends AutoDisposeFutureProviderElement<Map<DateTime, List<WorkItem>>>
    with WorkItemsByDateRef {
  _WorkItemsByDateProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as WorkItemsByDateProvider).workspaceSlug;
  @override
  String get projectId => (origin as WorkItemsByDateProvider).projectId;
}

String _$calendarNotifierHash() => r'd6ce97688b8cd275a4f389ed979f8c9e221370f0';

abstract class _$CalendarNotifier
    extends BuildlessAutoDisposeNotifier<DateTime> {
  late final String workspaceSlug;
  late final String projectId;

  DateTime build({required String workspaceSlug, required String projectId});
}

/// See also [CalendarNotifier].
@ProviderFor(CalendarNotifier)
const calendarNotifierProvider = CalendarNotifierFamily();

/// See also [CalendarNotifier].
class CalendarNotifierFamily extends Family<DateTime> {
  /// See also [CalendarNotifier].
  const CalendarNotifierFamily();

  /// See also [CalendarNotifier].
  CalendarNotifierProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return CalendarNotifierProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  CalendarNotifierProvider getProviderOverride(
    covariant CalendarNotifierProvider provider,
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
  String? get name => r'calendarNotifierProvider';
}

/// See also [CalendarNotifier].
class CalendarNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CalendarNotifier, DateTime> {
  /// See also [CalendarNotifier].
  CalendarNotifierProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         () => CalendarNotifier()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId,
         from: calendarNotifierProvider,
         name: r'calendarNotifierProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$calendarNotifierHash,
         dependencies: CalendarNotifierFamily._dependencies,
         allTransitiveDependencies:
             CalendarNotifierFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  CalendarNotifierProvider._internal(
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
  DateTime runNotifierBuild(covariant CalendarNotifier notifier) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(CalendarNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CalendarNotifierProvider._internal(
        () => create()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId,
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
  AutoDisposeNotifierProviderElement<CalendarNotifier, DateTime>
  createElement() {
    return _CalendarNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarNotifierProvider &&
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
mixin CalendarNotifierRef on AutoDisposeNotifierProviderRef<DateTime> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _CalendarNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CalendarNotifier, DateTime>
    with CalendarNotifierRef {
  _CalendarNotifierProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as CalendarNotifierProvider).workspaceSlug;
  @override
  String get projectId => (origin as CalendarNotifierProvider).projectId;
}

String _$selectedDateNotifierHash() =>
    r'63d5a5ac6fbc633b6b6bd191b3f4e71fe773591c';

abstract class _$SelectedDateNotifier
    extends BuildlessAutoDisposeNotifier<DateTime?> {
  late final String workspaceSlug;
  late final String projectId;

  DateTime? build({required String workspaceSlug, required String projectId});
}

/// See also [SelectedDateNotifier].
@ProviderFor(SelectedDateNotifier)
const selectedDateNotifierProvider = SelectedDateNotifierFamily();

/// See also [SelectedDateNotifier].
class SelectedDateNotifierFamily extends Family<DateTime?> {
  /// See also [SelectedDateNotifier].
  const SelectedDateNotifierFamily();

  /// See also [SelectedDateNotifier].
  SelectedDateNotifierProvider call({
    required String workspaceSlug,
    required String projectId,
  }) {
    return SelectedDateNotifierProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
    );
  }

  @override
  SelectedDateNotifierProvider getProviderOverride(
    covariant SelectedDateNotifierProvider provider,
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
  String? get name => r'selectedDateNotifierProvider';
}

/// See also [SelectedDateNotifier].
class SelectedDateNotifierProvider
    extends AutoDisposeNotifierProviderImpl<SelectedDateNotifier, DateTime?> {
  /// See also [SelectedDateNotifier].
  SelectedDateNotifierProvider({
    required String workspaceSlug,
    required String projectId,
  }) : this._internal(
         () => SelectedDateNotifier()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId,
         from: selectedDateNotifierProvider,
         name: r'selectedDateNotifierProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$selectedDateNotifierHash,
         dependencies: SelectedDateNotifierFamily._dependencies,
         allTransitiveDependencies:
             SelectedDateNotifierFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
       );

  SelectedDateNotifierProvider._internal(
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
  DateTime? runNotifierBuild(covariant SelectedDateNotifier notifier) {
    return notifier.build(workspaceSlug: workspaceSlug, projectId: projectId);
  }

  @override
  Override overrideWith(SelectedDateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedDateNotifierProvider._internal(
        () => create()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId,
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
  AutoDisposeNotifierProviderElement<SelectedDateNotifier, DateTime?>
  createElement() {
    return _SelectedDateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedDateNotifierProvider &&
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
mixin SelectedDateNotifierRef on AutoDisposeNotifierProviderRef<DateTime?> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;
}

class _SelectedDateNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedDateNotifier, DateTime?>
    with SelectedDateNotifierRef {
  _SelectedDateNotifierProviderElement(super.provider);

  @override
  String get workspaceSlug =>
      (origin as SelectedDateNotifierProvider).workspaceSlug;
  @override
  String get projectId => (origin as SelectedDateNotifierProvider).projectId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
