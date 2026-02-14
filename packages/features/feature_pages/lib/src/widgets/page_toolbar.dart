import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:theme/theme.dart';

/// Formatting toolbar for the page editor.
/// Provides bold, italic, underline, strikethrough, headings,
/// lists, links, and code block controls.
class PageToolbar extends StatelessWidget {
  const PageToolbar({
    required this.controller,
    super.key,
  });

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: PlaneColors.surfaceLight,
        border: Border(
          top: BorderSide(color: PlaneColors.grey200),
        ),
      ),
      child: QuillSimpleToolbar(
        controller: controller,
        config: const QuillSimpleToolbarConfig(
          showBackgroundColorButton: false,
          multiRowsDisplay: false,
        ),
      ),
    );
  }
}
