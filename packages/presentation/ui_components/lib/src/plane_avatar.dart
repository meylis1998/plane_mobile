import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// User avatar with image URL support, initials fallback, and online indicator.
class PlaneAvatar extends StatelessWidget {
  const PlaneAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.size = 40,
    this.showOnlineIndicator = false,
    this.isOnline = false,
    this.backgroundColor,
  });

  final String? imageUrl;
  final String? name;
  final double size;
  final bool showOnlineIndicator;
  final bool isOnline;
  final Color? backgroundColor;

  String get _initials {
    if (name == null || name!.isEmpty) return '?';
    final parts = name!.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = backgroundColor ?? theme.colorScheme.primaryContainer;

    Widget avatar;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatar = CachedNetworkImage(
        imageUrl: imageUrl!,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: size / 2,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) => _buildInitialsAvatar(bgColor, theme),
        errorWidget: (context, url, error) =>
            _buildInitialsAvatar(bgColor, theme),
      );
    } else {
      avatar = _buildInitialsAvatar(bgColor, theme);
    }

    if (!showOnlineIndicator) return avatar;

    return Stack(
      children: [
        avatar,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: size * 0.3,
            height: size * 0.3,
            decoration: BoxDecoration(
              color: isOnline ? PlaneColors.success : PlaneColors.grey400,
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.surface,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInitialsAvatar(Color bgColor, ThemeData theme) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: bgColor,
      child: Text(
        _initials,
        style: PlaneTypography.labelMedium.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontSize: size * 0.36,
        ),
      ),
    );
  }
}
