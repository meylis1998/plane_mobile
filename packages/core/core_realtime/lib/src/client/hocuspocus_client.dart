import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:core_realtime/src/events/connection_state.dart'
    as realtime;
import 'package:web_socket_channel/web_socket_channel.dart';

/// Callback for creating a [WebSocketChannel] from a [Uri].
typedef HocuspocusChannelFactory = WebSocketChannel Function(Uri uri);

/// Client for Hocuspocus real-time document collaboration.
///
/// Connects to a Hocuspocus WebSocket server and provides a stream-based
/// API for sending and receiving Yjs document updates.
class HocuspocusClient {
  HocuspocusClient({
    required String baseUrl,
    HocuspocusChannelFactory? channelFactory,
  })  : _baseUrl = baseUrl,
        _channelFactory = channelFactory ?? _defaultFactory;

  static WebSocketChannel _defaultFactory(Uri uri) =>
      WebSocketChannel.connect(uri);

  final String _baseUrl;
  final HocuspocusChannelFactory _channelFactory;

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;

  final _updateController = StreamController<Uint8List>.broadcast();
  final _stateController =
      StreamController<realtime.ConnectionState>.broadcast();

  realtime.ConnectionState _currentState =
      realtime.ConnectionState.disconnected;

  /// Stream of document updates received from the server.
  Stream<Uint8List> get onUpdate => _updateController.stream;

  /// Stream of connection state changes.
  Stream<realtime.ConnectionState> get connectionStateStream =>
      _stateController.stream;

  /// The current connection state.
  realtime.ConnectionState get currentState => _currentState;

  /// Connect to a specific document for real-time collaboration.
  Future<void> connectToDocument({
    required String workspaceSlug,
    required String pageId,
  }) async {
    _updateState(realtime.ConnectionState.connecting);

    try {
      var base = _baseUrl;
      if (base.startsWith('https')) {
        base = base.replaceFirst('https', 'wss');
      } else if (base.startsWith('http')) {
        base = base.replaceFirst('http', 'ws');
      }

      final uri =
          Uri.parse('$base/collaboration/$workspaceSlug/$pageId');
      _channel = _channelFactory(uri);
      await _channel!.ready;

      _updateState(realtime.ConnectionState.connected);

      _subscription = _channel!.stream.listen(
        _onMessage,
        onError: (_) {
          _updateState(realtime.ConnectionState.error);
        },
        onDone: () {
          _updateState(realtime.ConnectionState.disconnected);
        },
      );
    } catch (_) {
      _updateState(realtime.ConnectionState.error);
    }
  }

  void _onMessage(dynamic data) {
    if (data is String) {
      try {
        final json = jsonDecode(data) as Map<String, dynamic>;
        if (json['type'] == 'update' && json['data'] is String) {
          final bytes = base64Decode(json['data'] as String);
          _updateController.add(Uint8List.fromList(bytes));
        }
      } catch (_) {
        // Ignore malformed messages.
      }
    } else if (data is List<int>) {
      _updateController.add(Uint8List.fromList(data));
    }
  }

  /// Send a Yjs document update to the server.
  void sendUpdate(Uint8List data) {
    if (_currentState != realtime.ConnectionState.connected) return;

    _channel?.sink.add(
      jsonEncode({
        'type': 'update',
        'data': base64Encode(data),
      }),
    );
  }

  /// Disconnect from the current document.
  Future<void> disconnect() async {
    await _subscription?.cancel();
    _subscription = null;
    await _channel?.sink.close();
    _channel = null;
    _updateState(realtime.ConnectionState.disconnected);
  }

  void _updateState(realtime.ConnectionState newState) {
    if (_currentState == newState) return;
    _currentState = newState;
    _stateController.add(newState);
  }

  /// Dispose all resources. The client cannot be reused after this.
  void dispose() {
    _subscription?.cancel();
    _channel?.sink.close();
    _updateController.close();
    _stateController.close();
  }
}
