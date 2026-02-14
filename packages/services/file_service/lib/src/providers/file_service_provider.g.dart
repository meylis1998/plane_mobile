// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileServiceHash() => r'd8a535d506229f115f7bcd5b4ab61471e2298f0c';

/// Provides a singleton [PlaneFileService] backed by the [PlaneApiClient].
///
/// Must be overridden at the app level with the real [PlaneApiClient].
///
/// Copied from [fileService].
@ProviderFor(fileService)
final fileServiceProvider = Provider<PlaneFileService>.internal(
  fileService,
  name: r'fileServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fileServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FileServiceRef = ProviderRef<PlaneFileService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
