// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$secureStorageServiceHash() =>
    r'e6a02a22edfe9ccff4d341f7d1d14daf7cade897';

/// See also [secureStorageService].
@ProviderFor(secureStorageService)
final secureStorageServiceProvider = Provider<SecureStorageService>.internal(
  secureStorageService,
  name: r'secureStorageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureStorageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SecureStorageServiceRef = ProviderRef<SecureStorageService>;
String _$authStateNotifierHash() => r'ba2c4fea4d50a8cc05fdee7d7fb7b347a6dee9bb';

/// See also [AuthStateNotifier].
@ProviderFor(AuthStateNotifier)
final authStateNotifierProvider =
    NotifierProvider<AuthStateNotifier, AuthState>.internal(
      AuthStateNotifier.new,
      name: r'authStateNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authStateNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthStateNotifier = Notifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
