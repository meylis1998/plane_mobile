import 'package:ai_service/src/models/ai_response.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A bottom sheet that displays the original text alongside the AI result,
/// with Accept and Reject actions.
class AiResultSheet extends StatelessWidget {
  const AiResultSheet({
    required this.response,
    required this.onAccept,
    required this.onReject,
    super.key,
  });

  final AiResponse response;

  /// Called when the user accepts the AI result.
  final void Function(String result) onAccept;

  /// Called when the user rejects the AI result.
  final VoidCallback onReject;

  /// Shows the sheet as a modal bottom sheet.
  static Future<void> show(
    BuildContext context, {
    required AiResponse response,
    required void Function(String result) onAccept,
    required VoidCallback onReject,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => AiResultSheet(
        response: response,
        onAccept: (result) {
          Navigator.pop(context);
          onAccept(result);
        },
        onReject: () {
          Navigator.pop(context);
          onReject();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: PlaneColors.grey300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.auto_awesome, color: PlaneColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      response.action.label,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    _SectionLabel(label: 'Original', theme: theme),
                    const SizedBox(height: 8),
                    _TextCard(
                      text: response.originalText,
                      backgroundColor: PlaneColors.grey100,
                      theme: theme,
                    ),
                    const SizedBox(height: 20),
                    _SectionLabel(label: 'AI Result', theme: theme),
                    const SizedBox(height: 8),
                    _TextCard(
                      text: response.result,
                      backgroundColor: PlaneColors.primarySurface,
                      theme: theme,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onReject,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: PlaneColors.grey700,
                          side: const BorderSide(
                            color: PlaneColors.borderLight,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Reject'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () => onAccept(response.result),
                        style: FilledButton.styleFrom(
                          backgroundColor: PlaneColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Accept'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label, required this.theme});

  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: theme.textTheme.labelMedium?.copyWith(
        color: PlaneColors.textSecondaryLight,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _TextCard extends StatelessWidget {
  const _TextCard({
    required this.text,
    required this.backgroundColor,
    required this.theme,
  });

  final String text;
  final Color backgroundColor;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SelectableText(
        text,
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}
