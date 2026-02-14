import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Renders a project emoji or a colored fallback icon.
class ProjectEmoji extends StatelessWidget {
  const ProjectEmoji({
    this.emoji,
    this.size = 32,
    super.key,
  });

  final String? emoji;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (emoji != null && emoji!.isNotEmpty) {
      return SizedBox(
        width: size,
        height: size,
        child: Center(
          child: Text(
            emoji!,
            style: TextStyle(fontSize: size * 0.7),
          ),
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: PlaneColors.primarySurface,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        Icons.folder_outlined,
        size: size * 0.55,
        color: PlaneColors.primary,
      ),
    );
  }
}
