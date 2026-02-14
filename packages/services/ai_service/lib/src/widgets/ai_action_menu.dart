import 'package:ai_service/src/models/ai_action.dart';
import 'package:ai_service/src/models/ai_tone.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A bottom sheet presenting the available AI actions.
///
/// When an action is tapped, [onActionSelected] is invoked.
/// For tone adjustment, a submenu of [AiTone] values is shown first.
class AiActionMenu extends StatelessWidget {
  const AiActionMenu({
    required this.onActionSelected,
    this.showGenerateDescription = true,
    super.key,
  });

  /// Called when the user picks an action (and optionally a tone).
  final void Function(AiAction action, AiTone? tone) onActionSelected;

  /// Whether to show the "Generate Description" option.
  final bool showGenerateDescription;

  /// Shows the menu as a modal bottom sheet.
  static Future<void> show(
    BuildContext context, {
    required void Function(AiAction action, AiTone? tone) onActionSelected,
    bool showGenerateDescription = true,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => AiActionMenu(
        onActionSelected: (action, tone) {
          Navigator.pop(context);
          onActionSelected(action, tone);
        },
        showGenerateDescription: showGenerateDescription,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.auto_awesome, color: PlaneColors.primary),
                const SizedBox(width: 8),
                Text(
                  'AI Actions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _ActionTile(
            icon: Icons.edit_note,
            label: AiAction.improve.label,
            onTap: () => onActionSelected(AiAction.improve, null),
          ),
          _ActionTile(
            icon: Icons.spellcheck,
            label: AiAction.grammar.label,
            onTap: () => onActionSelected(AiAction.grammar, null),
          ),
          _ActionTile(
            icon: Icons.summarize,
            label: AiAction.summarize.label,
            onTap: () => onActionSelected(AiAction.summarize, null),
          ),
          _ToneSubmenuTile(
            onToneSelected: (tone) =>
                onActionSelected(AiAction.tone, tone),
          ),
          if (showGenerateDescription)
            _ActionTile(
              icon: Icons.description,
              label: AiAction.generate.label,
              onTap: () => onActionSelected(AiAction.generate, null),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: PlaneColors.grey600),
      title: Text(label),
      onTap: onTap,
    );
  }
}

class _ToneSubmenuTile extends StatefulWidget {
  const _ToneSubmenuTile({required this.onToneSelected});

  final void Function(AiTone tone) onToneSelected;

  @override
  State<_ToneSubmenuTile> createState() => _ToneSubmenuTileState();
}

class _ToneSubmenuTileState extends State<_ToneSubmenuTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.tune, color: PlaneColors.grey600),
          title: const Text('Adjust Tone'),
          trailing: Icon(
            _expanded ? Icons.expand_less : Icons.expand_more,
            color: PlaneColors.grey400,
          ),
          onTap: () => setState(() => _expanded = !_expanded),
        ),
        if (_expanded)
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: AiTone.values
                  .map(
                    (tone) => ListTile(
                      dense: true,
                      title: Text(tone.label),
                      onTap: () => widget.onToneSelected(tone),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}
