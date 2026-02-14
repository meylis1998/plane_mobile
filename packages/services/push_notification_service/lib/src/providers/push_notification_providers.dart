import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notification_service/src/service/push_notification_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_notification_providers.g.dart';

/// Provides the singleton [PushNotificationService].
///
/// This provider is kept alive for the lifetime of the app because
/// push notifications must be handled globally regardless of which
/// screen is active.
///
/// Override this provider in [ProviderScope] if you need to inject
/// a custom instance (e.g., for testing).
@Riverpod(keepAlive: true)
PushNotificationService pushNotificationService(Ref ref) {
  final service = PushNotificationService();
  ref.onDispose(service.dispose);
  return service;
}

/// Provides the current FCM token as an async value.
///
/// Resolves once the initial token is available and rebuilds whenever
/// the token is refreshed. Returns `null` if Firebase is not configured.
@Riverpod(keepAlive: true)
class FcmToken extends _$FcmToken {
  StreamSubscription<String>? _subscription;

  @override
  FutureOr<String?> build() async {
    final service = ref.watch(pushNotificationServiceProvider);

    // Listen for token refreshes and update state.
    _subscription = service.onTokenRefresh.listen((token) {
      state = AsyncData(token);
    });

    ref.onDispose(() => _subscription?.cancel());

    // Return the current token (may be null if Firebase is unavailable).
    return service.getToken();
  }
}
