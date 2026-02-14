import 'package:core_realtime/src/client/hocuspocus_client.dart';
import 'package:core_realtime/src/client/plane_web_socket_client.dart';
import 'package:core_realtime/src/events/connection_state.dart'
    as realtime;
import 'package:core_realtime/src/events/plane_event.dart';
import 'package:core_realtime/src/handlers/plane_event_handler.dart';
import 'package:core_realtime/src/services/live_update_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'realtime_providers.g.dart';

/// Provides the singleton [PlaneWebSocketClient].
@Riverpod(keepAlive: true)
PlaneWebSocketClient webSocketClient(Ref ref) {
  final client = PlaneWebSocketClient();
  ref.onDispose(client.dispose);
  return client;
}

/// Provides the singleton [PlaneEventHandler] wired to the WebSocket client.
@Riverpod(keepAlive: true)
PlaneEventHandler planeEventHandler(Ref ref) {
  final client = ref.watch(webSocketClientProvider);
  final handler = PlaneEventHandler()..listen(client.eventStream);
  ref.onDispose(handler.dispose);
  return handler;
}

/// Provides the singleton [LiveUpdateService].
@Riverpod(keepAlive: true)
LiveUpdateService liveUpdateService(Ref ref) {
  final handler = ref.watch(planeEventHandlerProvider);
  final service = LiveUpdateService(eventHandler: handler, ref: ref);
  ref.onDispose(service.dispose);
  return service;
}

/// Stream provider for WebSocket connection state changes.
@riverpod
Stream<realtime.ConnectionState> connectionState(Ref ref) {
  final client = ref.watch(webSocketClientProvider);
  return client.connectionStateStream;
}

/// Provides the [HocuspocusClient] for document collaboration.
@Riverpod(keepAlive: true)
HocuspocusClient hocuspocusClient(Ref ref) {
  final client = HocuspocusClient(baseUrl: 'https://api.plane.so');
  ref.onDispose(client.dispose);
  return client;
}

/// Tracks per-workspace online presence information.
@riverpod
class Presence extends _$Presence {
  @override
  Map<String, PresenceStatus> build({required String workspaceSlug}) {
    final handler = ref.watch(planeEventHandlerProvider)
      ..registerHandler<PresenceUpdate>(_onPresenceUpdate);
    ref.onDispose(() {
      handler.unregisterHandler<PresenceUpdate>(_onPresenceUpdate);
    });
    return const {};
  }

  void _onPresenceUpdate(PlaneEvent event) {
    if (event is PresenceUpdate && event.workspaceSlug == workspaceSlug) {
      state = {
        ...state,
        event.userId: event.status,
      };
    }
  }
}
