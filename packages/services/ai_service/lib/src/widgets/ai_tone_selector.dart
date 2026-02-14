import 'package:ai_service/src/models/ai_tone.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A row of chips for selecting an [AiTone].
class AiToneSelector extends StatelessWidget {
  const AiToneSelector({
    required this.selectedTone,
    required this.onToneSelected,
    super.key,
  });

  /// The currently selected tone, or null if none is selected.
  final AiTone? selectedTone;

  /// Called when the user taps a tone chip.
  final void Function(AiTone tone) onToneSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: AiTone.values.map((tone) {
        final isSelected = tone == selectedTone;
        return ChoiceChip(
          label: Text(tone.label),
          selected: isSelected,
          onSelected: (_) => onToneSelected(tone),
          selectedColor: PlaneColors.primarySurface,
          backgroundColor: PlaneColors.grey100,
          labelStyle: TextStyle(
            color: isSelected ? PlaneColors.primary : PlaneColors.grey700,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
          side: BorderSide(
            color: isSelected ? PlaneColors.primary : PlaneColors.borderLight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }).toList(),
    );
  }
}
