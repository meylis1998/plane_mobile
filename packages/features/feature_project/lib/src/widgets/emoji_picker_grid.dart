import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A simple grid that lets the user pick an emoji for a project.
class EmojiPickerGrid extends StatelessWidget {
  const EmojiPickerGrid({
    required this.onEmojiSelected,
    this.selectedEmoji,
    super.key,
  });

  final ValueChanged<String> onEmojiSelected;
  final String? selectedEmoji;

  static const _emojis = [
    '\u{1F680}', // rocket
    '\u{1F4BB}', // laptop
    '\u{1F4CA}', // chart
    '\u{1F4D1}', // bookmark tabs
    '\u{1F3AF}', // target
    '\u{2728}', // sparkles
    '\u{1F527}', // wrench
    '\u{1F4A1}', // bulb
    '\u{1F3D7}', // building construction
    '\u{1F4E6}', // package
    '\u{1F30D}', // globe
    '\u{1F50D}', // magnifying glass
    '\u{1F4DD}', // memo
    '\u{1F4C1}', // file folder
    '\u{2699}', // gear
    '\u{1F3AE}', // game controller
    '\u{1F4F1}', // phone
    '\u{1F512}', // lock
    '\u{1F4AC}', // speech balloon
    '\u{1F4E2}', // loudspeaker
    '\u{2705}', // check mark
    '\u{1F525}', // fire
    '\u{1F4C8}', // chart increasing
    '\u{1F9E9}', // puzzle piece
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: _emojis.length,
      itemBuilder: (context, index) {
        final emoji = _emojis[index];
        final isSelected = emoji == selectedEmoji;
        return GestureDetector(
          onTap: () => onEmojiSelected(emoji),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? PlaneColors.primarySurface
                  : PlaneColors.grey50,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: PlaneColors.primary, width: 2)
                  : Border.all(color: PlaneColors.grey200),
            ),
            alignment: Alignment.center,
            child: Text(emoji, style: const TextStyle(fontSize: 22)),
          ),
        );
      },
    );
  }
}
