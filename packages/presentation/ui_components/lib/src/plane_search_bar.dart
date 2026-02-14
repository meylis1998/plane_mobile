import 'dart:async';

import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// Search input with debounce and clear button.
class PlaneSearchBar extends StatefulWidget {
  const PlaneSearchBar({
    super.key,
    this.controller,
    this.hint = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Duration debounceDuration;
  final bool autofocus;

  @override
  State<PlaneSearchBar> createState() => _PlaneSearchBarState();
}

class _PlaneSearchBarState extends State<PlaneSearchBar> {
  late final TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
    _debounce?.cancel();
    _debounce = Timer(widget.debounceDuration, () {
      widget.onChanged?.call(_controller.text);
    });
  }

  void _onClear() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autofocus: widget.autofocus,
      textInputAction: TextInputAction.search,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: const Icon(PlaneIcons.search, size: 20),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: _onClear,
              )
            : null,
      ),
    );
  }
}
