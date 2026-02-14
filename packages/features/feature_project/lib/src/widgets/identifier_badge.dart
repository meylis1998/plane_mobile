import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A chip-style badge that shows a project identifier (e.g. "PLN").
class IdentifierBadge extends StatelessWidget {
  const IdentifierBadge({required this.identifier, super.key});

  final String identifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: PlaneColors.grey100,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: PlaneColors.grey200),
      ),
      child: Text(
        identifier,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: PlaneColors.grey600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
