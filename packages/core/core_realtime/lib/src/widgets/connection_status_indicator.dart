import 'package:core_realtime/src/events/connection_state.dart'
    as realtime;
import 'package:core_realtime/src/providers/realtime_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A small dot that reflects the current WebSocket connection state.
///
/// * Green  — connected
/// * Yellow — connecting
/// * Red    — disconnected or error
class ConnectionStatusIndicator extends ConsumerWidget {
  const ConnectionStatusIndicator({
    super.key,
    this.size = 10,
  });

  /// Diameter of the indicator dot.
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(connectionStateProvider);

    return asyncState.when(
      data: (state) => _Dot(state: state, size: size),
      loading: () => _Dot(
        state: realtime.ConnectionState.connecting,
        size: size,
      ),
      error: (_, __) => _Dot(
        state: realtime.ConnectionState.error,
        size: size,
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    required this.state,
    required this.size,
  });

  final realtime.ConnectionState state;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _colorFor(state),
      ),
    );
  }

  static Color _colorFor(realtime.ConnectionState state) {
    return switch (state) {
      realtime.ConnectionState.connected => const Color(0xFF4CAF50),
      realtime.ConnectionState.connecting => const Color(0xFFFFC107),
      realtime.ConnectionState.disconnected => const Color(0xFFF44336),
      realtime.ConnectionState.error => const Color(0xFFF44336),
    };
  }
}
