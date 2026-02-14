import 'dart:async';

import 'package:core_realtime/src/events/plane_event.dart';

/// Callback type for handling a [PlaneEvent].
typedef PlaneEventCallback = void Function(PlaneEvent event);

/// Routes incoming [PlaneEvent]s from the WebSocket to registered handlers.
///
/// Handlers are keyed by the event's runtime type name
/// (e.g. `WorkItemCreated`).
class PlaneEventHandler {
  PlaneEventHandler();

  final Map<String, Set<PlaneEventCallback>> _handlers = {};
  StreamSubscription<PlaneEvent>? _subscription;

  /// Start listening to [eventStream] and dispatching events.
  void listen(Stream<PlaneEvent> eventStream) {
    _subscription?.cancel();
    _subscription = eventStream.listen(_dispatch);
  }

  /// Register a [callback] for a specific event type [T].
  ///
  /// Example:
  /// ```dart
  /// handler.registerHandler<WorkItemCreated>((event) { ... });
  /// ```
  void registerHandler<T extends PlaneEvent>(PlaneEventCallback callback) {
    final key = T.toString();
    _handlers.putIfAbsent(key, () => {}).add(callback);
  }

  /// Unregister a previously registered [callback] for type [T].
  void unregisterHandler<T extends PlaneEvent>(PlaneEventCallback callback) {
    final key = T.toString();
    _handlers[key]?.remove(callback);
  }

  /// Unregister all handlers for type [T].
  void unregisterAll<T extends PlaneEvent>() {
    final key = T.toString();
    _handlers.remove(key);
  }

  void _dispatch(PlaneEvent event) {
    final key = event.runtimeType.toString();
    final callbacks = _handlers[key];
    if (callbacks != null) {
      for (final cb in callbacks) {
        cb(event);
      }
    }
  }

  /// Stop listening and clear all handlers.
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _handlers.clear();
  }
}
