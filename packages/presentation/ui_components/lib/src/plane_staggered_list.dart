import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Wraps a list of children with staggered slide + fade entrance animations.
///
/// Each child animates in with a slight delay after the previous one,
/// creating a cascade effect on first load.
class PlaneStaggeredList extends StatefulWidget {
  const PlaneStaggeredList({
    required this.children,
    super.key,
    this.staggerDelay = const Duration(milliseconds: 50),
    this.animationDuration = const Duration(milliseconds: 300),
    this.slideOffset = 20.0,
  });

  final List<Widget> children;
  final Duration staggerDelay;
  final Duration animationDuration;
  final double slideOffset;

  @override
  State<PlaneStaggeredList> createState() => _PlaneStaggeredListState();
}

class _PlaneStaggeredListState extends State<PlaneStaggeredList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final totalDuration = widget.animationDuration +
        widget.staggerDelay * widget.children.length;
    _controller = AnimationController(
      vsync: this,
      duration: totalDuration,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.children.length;
    if (count == 0) return const SizedBox.shrink();

    final totalMs = _controller.duration!.inMilliseconds;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final startFraction =
            (widget.staggerDelay.inMilliseconds * index) / totalMs;
        final endFraction = math.min(
          // ignore: prefer_int_literals
          1.0,
          startFraction +
              widget.animationDuration.inMilliseconds / totalMs,
        );

        final animation = CurvedAnimation(
          parent: _controller,
          curve: Interval(
            startFraction,
            endFraction,
            curve: Curves.easeOutCubic,
          ),
        );

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Opacity(
            opacity: animation.value,
            child: Transform.translate(
              offset: Offset(0, widget.slideOffset * (1 - animation.value)),
              child: child,
            ),
          ),
          child: widget.children[index],
        );
      }),
    );
  }
}
