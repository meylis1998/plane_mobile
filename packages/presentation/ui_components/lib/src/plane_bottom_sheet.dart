import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A styled modal bottom sheet wrapper.
class PlaneBottomSheet extends StatelessWidget {
  const PlaneBottomSheet({
    required this.child,
    super.key,
    this.title,
    this.actions,
    this.padding,
  });

  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;

  /// Shows the bottom sheet modally.
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    List<Widget>? actions,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) => PlaneBottomSheet(
        title: title,
        actions: actions,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(PlaneSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title!,
                      style: PlaneTypography.titleMedium.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  if (actions != null) ...actions!,
                ],
              ),
              const SizedBox(height: PlaneSpacing.md),
            ],
            child,
          ],
        ),
      ),
    );
  }
}
