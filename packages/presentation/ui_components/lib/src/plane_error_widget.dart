import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Error display widget with icon, title, detail message, and retry button.
///
/// Provides a [PlaneErrorWidget.network] factory for network-specific
/// error messaging.
class PlaneErrorWidget extends StatelessWidget {
  const PlaneErrorWidget({
    required this.message,
    super.key,
    this.detail,
    this.icon,
    this.onRetry,
  });

  /// Network-specific error widget.
  factory PlaneErrorWidget.network({Key? key, VoidCallback? onRetry}) {
    return PlaneErrorWidget(
      key: key,
      message: 'No internet connection',
      detail: 'Check your network settings and try again.',
      icon: Icons.wifi_off_rounded,
      onRetry: onRetry,
    );
  }

  final String message;
  final String? detail;
  final IconData? icon;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PlaneSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PlaneColors.errorLight.withValues(alpha: 0.7),
              ),
              child: Icon(
                icon ?? Icons.error_outline_rounded,
                size: 40,
                color: PlaneColors.error,
              ),
            ),
            const SizedBox(height: PlaneSpacing.md),
            Text(
              message,
              style: PlaneTypography.titleMedium.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            if (detail != null) ...[
              const SizedBox(height: PlaneSpacing.sm),
              Text(
                detail!,
                style: PlaneTypography.bodyMedium.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: PlaneSpacing.lg),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
