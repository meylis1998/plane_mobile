import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Displays the workspace logo or a fallback with the first letter.
class WorkspaceLogo extends StatelessWidget {
  const WorkspaceLogo({
    required this.workspace,
    this.size = 40,
    super.key,
  });

  final Workspace workspace;
  final double size;

  @override
  Widget build(BuildContext context) {
    final logo = workspace.logo;
    if (logo != null && logo.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: logo,
          width: size,
          height: size,
          fit: BoxFit.cover,
          placeholder: (_, __) => _FallbackLogo(
            name: workspace.name,
            size: size,
          ),
          errorWidget: (_, __, ___) => _FallbackLogo(
            name: workspace.name,
            size: size,
          ),
        ),
      );
    }
    return _FallbackLogo(name: workspace.name, size: size);
  }
}

class _FallbackLogo extends StatelessWidget {
  const _FallbackLogo({required this.name, required this.size});

  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    final letter = name.isNotEmpty ? name[0].toUpperCase() : '?';
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: PlaneColors.primarySurface,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        letter,
        style: TextStyle(
          fontSize: size * 0.45,
          fontWeight: FontWeight.w700,
          color: PlaneColors.primary,
        ),
      ),
    );
  }
}
