/// Represents the state of a WebSocket connection.
enum ConnectionState {
  /// Initial state — not yet connected.
  disconnected,

  /// Actively attempting to establish a connection.
  connecting,

  /// Connection is open and operational.
  connected,

  /// An error occurred on the connection.
  error,
}
