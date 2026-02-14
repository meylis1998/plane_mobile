// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aiActionNotifierHash() => r'eb50c4ab0dc0c4120ebeb881175d2de7f9510d47';

/// Manages AI action execution with loading state.
///
/// The state holds the most recent [AiResponse] or null when idle.
///
/// Copied from [AiActionNotifier].
@ProviderFor(AiActionNotifier)
final aiActionNotifierProvider =
    AutoDisposeNotifierProvider<
      AiActionNotifier,
      AsyncValue<AiResponse?>
    >.internal(
      AiActionNotifier.new,
      name: r'aiActionNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$aiActionNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AiActionNotifier = AutoDisposeNotifier<AsyncValue<AiResponse?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
