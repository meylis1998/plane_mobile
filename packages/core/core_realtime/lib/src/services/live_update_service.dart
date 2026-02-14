import 'package:core_realtime/src/events/plane_event.dart';
import 'package:core_realtime/src/handlers/plane_event_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Callback signature for provider invalidation.
typedef ProviderInvalidator = void Function(PlaneEvent event);

/// Bridges real-time WebSocket events to Riverpod provider invalidation.
///
/// When a [PlaneEvent] arrives, the service notifies registered invalidators
/// so that the affected providers re-fetch their data from the server.
class LiveUpdateService {
  LiveUpdateService({
    required PlaneEventHandler eventHandler,
    required Ref ref,
  })  : _eventHandler = eventHandler,
        // ignore: unused_field
        _ref = ref {
    _registerHandlers();
  }

  final PlaneEventHandler _eventHandler;
  // ignore: unused_field
  final Ref _ref;

  final _customInvalidators = <String, Set<ProviderInvalidator>>{};

  /// Register a custom invalidator that will be called when events of type
  /// [T] are received.
  void registerInvalidator<T extends PlaneEvent>(
    ProviderInvalidator invalidator,
  ) {
    final key = T.toString();
    _customInvalidators.putIfAbsent(key, () => {}).add(invalidator);
  }

  /// Unregister a previously registered invalidator.
  void unregisterInvalidator<T extends PlaneEvent>(
    ProviderInvalidator invalidator,
  ) {
    final key = T.toString();
    _customInvalidators[key]?.remove(invalidator);
  }

  void _registerHandlers() {
    _eventHandler
      ..registerHandler<WorkItemCreated>(_onEvent)
      ..registerHandler<WorkItemUpdated>(_onEvent)
      ..registerHandler<WorkItemDeleted>(_onEvent)
      ..registerHandler<CommentAdded>(_onEvent)
      ..registerHandler<StateChanged>(_onEvent)
      ..registerHandler<AssigneeChanged>(_onEvent)
      ..registerHandler<CycleUpdated>(_onEvent)
      ..registerHandler<PresenceUpdate>(_onEvent);
  }

  void _onEvent(PlaneEvent event) {
    final key = event.runtimeType.toString();
    final invalidators = _customInvalidators[key];
    if (invalidators != null) {
      for (final invalidator in invalidators) {
        invalidator(event);
      }
    }
  }

  /// Dispose resources.
  void dispose() {
    _customInvalidators.clear();
  }
}
