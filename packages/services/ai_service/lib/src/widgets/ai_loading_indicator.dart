import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:theme/theme.dart';

/// A shimmer loading indicator displayed while an AI action is processing.
class AiLoadingIndicator extends StatelessWidget {
  const AiLoadingIndicator({this.message = 'AI is thinking...', super.key});

  /// An optional message shown below the shimmer lines.
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PlaneColors.primarySurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: PlaneColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                message,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: PlaneColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Shimmer.fromColors(
            baseColor: PlaneColors.grey200,
            highlightColor: PlaneColors.grey100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _shimmerLine(width: double.infinity),
                const SizedBox(height: 8),
                _shimmerLine(width: double.infinity),
                const SizedBox(height: 8),
                _shimmerLine(width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerLine({required double width}) {
    return Container(
      width: width,
      height: 12,
      decoration: BoxDecoration(
        color: PlaneColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
