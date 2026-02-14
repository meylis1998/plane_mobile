import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class CommentInput extends StatefulWidget {
  const CommentInput({
    required this.onSubmit,
    this.isLoading = false,
    super.key,
  });

  final void Function(String body) onSubmit;
  final bool isLoading;

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSubmit(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: PlaneColors.dividerLight),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                isDense: true,
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _submit(),
            ),
          ),
          const SizedBox(width: 8),
          widget.isLoading
              ? const SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : IconButton(
                  icon: const Icon(Icons.send_rounded),
                  color: PlaneColors.primary,
                  onPressed: _submit,
                ),
        ],
      ),
    );
  }
}
