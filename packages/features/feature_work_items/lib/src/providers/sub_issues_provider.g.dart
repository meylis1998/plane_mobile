// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_issues_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subIssuesHash() => r'07efa5cd046cc52e5acdb27635eb2afe96553b3d';

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

abstract class _$SubIssues
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkItem>> {
  late final String workspaceSlug;
  late final String projectId;
  late final String parentId;

  FutureOr<List<WorkItem>> build({
    required String workspaceSlug,
    required String projectId,
    required String parentId,
  });
}

/// See also [SubIssues].
@ProviderFor(SubIssues)
const subIssuesProvider = SubIssuesFamily();

/// See also [SubIssues].
class SubIssuesFamily extends Family<AsyncValue<List<WorkItem>>> {
  /// See also [SubIssues].
  const SubIssuesFamily();

  /// See also [SubIssues].
  SubIssuesProvider call({
    required String workspaceSlug,
    required String projectId,
    required String parentId,
  }) {
    return SubIssuesProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      parentId: parentId,
    );
  }

  @override
  SubIssuesProvider getProviderOverride(covariant SubIssuesProvider provider) {
    return call(
      workspaceSlug: provider.workspaceSlug,
      projectId: provider.projectId,
      parentId: provider.parentId,
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
  String? get name => r'subIssuesProvider';
}

/// See also [SubIssues].
class SubIssuesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SubIssues, List<WorkItem>> {
  /// See also [SubIssues].
  SubIssuesProvider({
    required String workspaceSlug,
    required String projectId,
    required String parentId,
  }) : this._internal(
         () => SubIssues()
           ..workspaceSlug = workspaceSlug
           ..projectId = projectId
           ..parentId = parentId,
         from: subIssuesProvider,
         name: r'subIssuesProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$subIssuesHash,
         dependencies: SubIssuesFamily._dependencies,
         allTransitiveDependencies: SubIssuesFamily._allTransitiveDependencies,
         workspaceSlug: workspaceSlug,
         projectId: projectId,
         parentId: parentId,
       );

  SubIssuesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.workspaceSlug,
    required this.projectId,
    required this.parentId,
  }) : super.internal();

  final String workspaceSlug;
  final String projectId;
  final String parentId;

  @override
  FutureOr<List<WorkItem>> runNotifierBuild(covariant SubIssues notifier) {
    return notifier.build(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      parentId: parentId,
    );
  }

  @override
  Override overrideWith(SubIssues Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubIssuesProvider._internal(
        () => create()
          ..workspaceSlug = workspaceSlug
          ..projectId = projectId
          ..parentId = parentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        workspaceSlug: workspaceSlug,
        projectId: projectId,
        parentId: parentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SubIssues, List<WorkItem>>
  createElement() {
    return _SubIssuesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubIssuesProvider &&
        other.workspaceSlug == workspaceSlug &&
        other.projectId == projectId &&
        other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, workspaceSlug.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubIssuesRef on AutoDisposeAsyncNotifierProviderRef<List<WorkItem>> {
  /// The parameter `workspaceSlug` of this provider.
  String get workspaceSlug;

  /// The parameter `projectId` of this provider.
  String get projectId;

  /// The parameter `parentId` of this provider.
  String get parentId;
}

class _SubIssuesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SubIssues, List<WorkItem>>
    with SubIssuesRef {
  _SubIssuesProviderElement(super.provider);

  @override
  String get workspaceSlug => (origin as SubIssuesProvider).workspaceSlug;
  @override
  String get projectId => (origin as SubIssuesProvider).projectId;
  @override
  String get parentId => (origin as SubIssuesProvider).parentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
