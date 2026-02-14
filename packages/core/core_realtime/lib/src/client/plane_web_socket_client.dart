import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:core_realtime/src/events/connection_state.dart'
    as realtime;
import 'package:core_realtime/src/events/plane_event.dart';
import 'package:meta/meta.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Callback for creating a [WebSocketChannel] from a [Uri].
///
/// This allows injecting test doubles.
typedef WebSocketChannelFactory = WebSocketChannel Function(Uri uri);

/// Manages a WebSocket connection to the Plane real-time server with
/// automatic reconnection using exponential backoff.
class PlaneWebSocketClient {
  PlaneWebSocketClient({
    WebSocketChannelFactory? channelFactory,
  }) : _channelFactory = channelFactory ?? _defaultChannelFactory;

  static WebSocketChannel _defaultChannelFactory(Uri uri) =>
      WebSocketChannel.connect(uri);

  final WebSocketChannelFactory _channelFactory;

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  Timer? _reconnectTimer;
  Timer? _heartbeatTimer;

  String? _baseUrl;
  String? _workspaceSlug;
  String? _authToken;

  int _reconnectAttempts = 0;

  /// Maximum delay between reconnection attempts in seconds.
  @visibleForTesting
  static const int maxReconnectDelaySec = 30;

  /// Base delay for exponential backoff in seconds.
  @visibleForTesting
  static const int baseReconnectDelaySec = 1;

  /// Interval for sending heartbeat pings in seconds.
  static const int heartbeatIntervalSec = 30;

  final _connectionStateController =
      StreamController<realtime.ConnectionState>.broadcast();

  final _eventController = StreamController<PlaneEvent>.broadcast();

  realtime.ConnectionState _currentState =
      realtime.ConnectionState.disconnected;

  /// Stream of connection state changes.
  Stream<realtime.ConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  /// Stream of parsed [PlaneEvent]s received from the server.
  Stream<PlaneEvent> get eventStream => _eventController.stream;

  /// Whether the WebSocket is currently connected.
  bool get isConnected =>
      _currentState == realtime.ConnectionState.connected;

  /// The current connection state.
  realtime.ConnectionState get currentState => _currentState;

  /// Establish a WebSocket connection.
  Future<void> connect({
    required String baseUrl,
    required String workspaceSlug,
    required String authToken,
  }) async {
    _baseUrl = baseUrl;
    _workspaceSlug = workspaceSlug;
    _authToken = authToken;

    await _connect();
  }

  Future<void> _connect() async {
    _updateState(realtime.ConnectionState.connecting);

    try {
      final wsUrl = _buildUri();
      _channel = _channelFactory(wsUrl);

      // Await the ready future if the channel supports it.
      await _channel!.ready;

      _updateState(realtime.ConnectionState.connected);
      _reconnectAttempts = 0;

      _startHeartbeat();

      _subscription = _channel!.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
      );
    } catch (e) {
      _updateState(realtime.ConnectionState.error);
      _scheduleReconnect();
    }
  }

  Uri _buildUri() {
    // Convert http(s) to ws(s).
    var base = _baseUrl!;
    if (base.startsWith('https')) {
      base = base.replaceFirst('https', 'wss');
    } else if (base.startsWith('http')) {
      base = base.replaceFirst('http', 'ws');
    }

    return Uri.parse('$base/ws/$_workspaceSlug/')
        .replace(queryParameters: {'token': _authToken});
  }

  void _onMessage(dynamic data) {
    if (data is! String) return;

    try {
      final json = jsonDecode(data) as Map<String, dynamic>;
      final event = PlaneEvent.fromJson(json);
      _eventController.add(event);
    } catch (_) {
      // Silently ignore malformed messages.
    }
  }

  void _onError(Object error) {
    _updateState(realtime.ConnectionState.error);
    _cleanup();
    _scheduleReconnect();
  }

  void _onDone() {
    _updateState(realtime.ConnectionState.disconnected);
    _cleanup();
    _scheduleReconnect();
  }

  /// Close the connection and stop all timers.
  Future<void> disconnect() async {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _reconnectAttempts = 0;
    _cleanup();
    await _channel?.sink.close();
    _channel = null;
    _updateState(realtime.ConnectionState.disconnected);
  }

  /// Manually trigger a reconnection.
  Future<void> reconnect() async {
    _cleanup();
    await _channel?.sink.close();
    _channel = null;
    _reconnectAttempts = 0;
    await _connect();
  }

  void _scheduleReconnect() {
    if (_baseUrl == null || _authToken == null) return;

    _reconnectTimer?.cancel();

    final delaySec = min(
      baseReconnectDelaySec * pow(2, _reconnectAttempts).toInt(),
      maxReconnectDelaySec,
    );
    _reconnectAttempts++;

    _reconnectTimer = Timer(Duration(seconds: delaySec), _connect);
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(
      const Duration(seconds: heartbeatIntervalSec),
      (_) {
        if (isConnected) {
          try {
            _channel?.sink.add(jsonEncode({'type': 'ping'}));
          } catch (_) {
            // Connection might have closed between the check and the send.
          }
        }
      },
    );
  }

  void _cleanup() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
    _subscription?.cancel();
    _subscription = null;
  }

  void _updateState(realtime.ConnectionState newState) {
    if (_currentState == newState) return;
    _currentState = newState;
    _connectionStateController.add(newState);
  }

  /// Dispose all resources. The client cannot be reused after this.
  void dispose() {
    _reconnectTimer?.cancel();
    _cleanup();
    _channel?.sink.close();
    _connectionStateController.close();
    _eventController.close();
  }
}
