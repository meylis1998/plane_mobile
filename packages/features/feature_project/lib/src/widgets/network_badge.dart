import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A small badge that indicates whether the project is secret or private.
class NetworkBadge extends StatelessWidget {
  const NetworkBadge({required this.network, super.key});

  final ProjectNetwork network;

  @override
  Widget build(BuildContext context) {
    final isSecret = network == ProjectNetwork.secret;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isSecret ? Icons.lock_outline : Icons.lock_open_outlined,
          size: 14,
          color: isSecret ? PlaneColors.warning : PlaneColors.grey400,
        ),
        const SizedBox(width: 4),
        Text(
          isSecret ? 'Secret' : 'Private',
          style: TextStyle(
            fontSize: 12,
            color: isSecret ? PlaneColors.warning : PlaneColors.grey500,
          ),
        ),
      ],
    );
  }
}
