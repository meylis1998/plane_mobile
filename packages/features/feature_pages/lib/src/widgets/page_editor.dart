import 'dart:async';
import 'dart:convert';

import 'package:feature_pages/src/widgets/page_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:theme/theme.dart';

/// Rich text editor for page content using flutter_quill.
///
/// Converts between JSON (stored as page content) and Quill Delta format.
/// Supports auto-save with a 2-second debounce on changes.
class PageEditor extends StatefulWidget {
  const PageEditor({
    required this.initialContent,
    required this.onContentChanged,
    this.readOnly = false,
    super.key,
  });

  /// Initial content as a JSON string (Quill Delta format).
  /// Empty string or null will create a blank document.
  final String initialContent;

  /// Called when content changes, after debounce.
  /// Receives the content as a JSON string.
  final void Function(String content) onContentChanged;

  /// Whether the editor is read-only.
  final bool readOnly;

  @override
  State<PageEditor> createState() => _PageEditorState();
}

class _PageEditorState extends State<PageEditor> {
  late QuillController _controller;
  Timer? _debounce;
  bool _hasUnsavedChanges = false;

  static const _debounceDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _controller = _createController(widget.initialContent);
    _controller.document.changes.listen((_) {
      _onDocumentChange();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  QuillController _createController(String content) {
    if (content.isEmpty) {
      return QuillController.basic();
    }

    try {
      final json = jsonDecode(content);
      if (json is List) {
        final document = Document.fromJson(json);
        return QuillController(
          document: document,
          selection: const TextSelection.collapsed(offset: 0),
        );
      }
    } on Object catch (_) {
      // If content is not valid Delta JSON, create from plain text
    }

    // Fallback: treat as plain text
    final document = Document()..insert(0, content);
    return QuillController(
      document: document,
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  void _onDocumentChange() {
    if (!_hasUnsavedChanges) {
      setState(() => _hasUnsavedChanges = true);
    }

    _debounce?.cancel();
    _debounce = Timer(_debounceDuration, _save);
  }

  void _save() {
    final json = jsonEncode(_controller.document.toDelta().toJson());
    widget.onContentChanged(json);
    if (mounted) {
      setState(() => _hasUnsavedChanges = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Save indicator
        if (_hasUnsavedChanges)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            color: PlaneColors.warningLight,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: PlaneColors.warning,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Unsaved changes',
                  style: TextStyle(
                    fontSize: 12,
                    color: PlaneColors.warning,
                  ),
                ),
              ],
            ),
          ),
        // Editor body
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: QuillEditor.basic(
              controller: _controller,
              config: const QuillEditorConfig(
                placeholder: 'Start writing...',
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ),
        // Toolbar
        if (!widget.readOnly) PageToolbar(controller: _controller),
      ],
    );
  }
}
