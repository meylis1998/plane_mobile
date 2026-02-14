import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A small chip that displays a stat icon and value (e.g. issue count).
class ProjectStatChip extends StatelessWidget {
  const ProjectStatChip({
    required this.icon,
    required this.label,
    this.color,
    super.key,
  });

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? PlaneColors.grey500;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: PlaneColors.grey50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: chipColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: chipColor,
            ),
          ),
        ],
      ),
    );
  }
}
