// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_attachment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uploadAttachmentHash() => r'e0e9ad6a8c833504b35fb7dd33e8719537572ce9';

/// Manages file upload state with progress tracking.
///
/// Copied from [UploadAttachment].
@ProviderFor(UploadAttachment)
final uploadAttachmentProvider =
    AutoDisposeNotifierProvider<UploadAttachment, UploadProgress?>.internal(
      UploadAttachment.new,
      name: r'uploadAttachmentProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$uploadAttachmentHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UploadAttachment = AutoDisposeNotifier<UploadProgress?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
