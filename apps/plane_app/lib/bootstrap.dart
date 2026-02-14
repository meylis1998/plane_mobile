import 'dart:async';

import 'package:core_di/core_di.dart';
import 'package:core_realtime/core_realtime.dart';
import 'package:data_sync/data_sync.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plane_app/app.dart';
import 'package:push_notification_service/push_notification_service.dart';

/// Bootstraps the application.
///
/// Initializes Flutter bindings, wraps the app in a [ProviderScope],
/// and triggers an auth check on startup to restore any saved session.
/// After authentication, initializes sync engine, WebSocket connection,
/// and push notification services.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  // Check if the user has stored credentials and restore the session.
  await container.read(authStateNotifierProvider.notifier).checkAuth();

  // Initialize Phase 5 services after auth check.
  _initializePhase5Services(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const PlaneApp(),
    ),
  );
}

/// Initializes sync engine, WebSocket, and push notification services.
///
/// Listens to auth state changes to start/stop services accordingly.
void _initializePhase5Services(ProviderContainer container) {
  final authState = container.read(authStateNotifierProvider);

  // Start services if already authenticated.
  if (authState is Authenticated) {
    _startAuthenticatedServices(container);
  }

  // Listen for auth state transitions.
  container.listen<AuthState>(authStateNotifierProvider, (previous, next) {
    if (next is Authenticated && previous is! Authenticated) {
      _startAuthenticatedServices(container);
    } else if (next is Unauthenticated && previous is Authenticated) {
      _stopAuthenticatedServices(container);
    }
  });

  // Initialize push notifications (does not require auth).
  _initializePushNotifications(container);
}

/// Starts services that require an authenticated session.
void _startAuthenticatedServices(ProviderContainer container) {
  // -- Sync engine: start periodic sync every 5 minutes --
  final syncQueueDao = container.read(syncQueueDaoProvider);
  final apiClient = container.read(planeApiClientProvider);
  final engine = container.read(
    syncEngineProvider(dao: syncQueueDao, apiClient: apiClient),
  );
  engine.schedulePeriodicSync(const Duration(minutes: 5));

  // Run an initial sync immediately.
  unawaited(engine.startSync());

  // -- WebSocket: connect to real-time server --
  final workspace = container.read(selectedWorkspaceProvider);
  if (workspace != null) {
    final wsClient = container.read(webSocketClientProvider);
    unawaited(
      wsClient.connect(
        baseUrl: 'https://api.plane.so',
        workspaceSlug: workspace.slug,
        authToken: '', // Token is read from secure storage by the client.
      ),
    );

    // Eagerly read the LiveUpdateService to start listening for events.
    container.read(liveUpdateServiceProvider);
  }
}

/// Stops authenticated services on logout.
void _stopAuthenticatedServices(ProviderContainer container) {
  // Stop periodic sync.
  final syncQueueDao = container.read(syncQueueDaoProvider);
  final apiClient = container.read(planeApiClientProvider);
  final engine = container.read(
    syncEngineProvider(dao: syncQueueDao, apiClient: apiClient),
  );
  engine.stopSync();

  // Disconnect WebSocket.
  final wsClient = container.read(webSocketClientProvider);
  unawaited(wsClient.disconnect());
}

/// Initializes push notification service and sets up notification routing.
void _initializePushNotifications(ProviderContainer container) {
  final pushService = container.read(pushNotificationServiceProvider);
  unawaited(pushService.initialize());

  // Route notification taps are handled via the onNotificationRoute stream.
  // The PlaneApp widget listens to this stream and navigates via GoRouter.
}
