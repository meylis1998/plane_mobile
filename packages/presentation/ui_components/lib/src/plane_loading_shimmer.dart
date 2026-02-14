import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:theme/theme.dart';

/// Shimmer placeholder widgets for loading states.
class PlaneLoadingShimmer extends StatelessWidget {
  const PlaneLoadingShimmer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.child,
  });

  /// Creates a list shimmer with repeated rows.
  factory PlaneLoadingShimmer.list({
    Key? key,
    int itemCount = 5,
  }) {
    return PlaneLoadingShimmer(
      key: key,
      child: Column(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PlaneSpacing.md,
              vertical: PlaneSpacing.sm,
            ),
            child: Row(
              children: [
                const _ShimmerBox(width: 40, height: 40, isCircle: true),
                const SizedBox(width: PlaneSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ShimmerBox(
                        height: 14,
                        width: 160 + (index % 3) * 40,
                      ),
                      const SizedBox(height: PlaneSpacing.xs),
                      const _ShimmerBox(height: 12, width: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Creates a card shimmer placeholder.
  factory PlaneLoadingShimmer.card({Key? key}) {
    return PlaneLoadingShimmer(
      key: key,
      child: const Padding(
        padding: EdgeInsets.all(PlaneSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShimmerBox(height: 16, width: 200),
            SizedBox(height: PlaneSpacing.sm),
            _ShimmerBox(height: 12, width: double.infinity),
            SizedBox(height: PlaneSpacing.xs),
            _ShimmerBox(height: 12, width: 260),
            SizedBox(height: PlaneSpacing.md),
            Row(
              children: [
                _ShimmerBox(width: 60, height: 24),
                SizedBox(width: PlaneSpacing.sm),
                _ShimmerBox(width: 60, height: 24),
                Spacer(),
                _ShimmerBox(width: 24, height: 24, isCircle: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a card list shimmer with multiple cards.
  factory PlaneLoadingShimmer.cardList({Key? key, int itemCount = 3}) {
    return PlaneLoadingShimmer(
      key: key,
      child: Column(
        children: List.generate(
          itemCount,
          (_) => const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: PlaneSpacing.md,
              vertical: PlaneSpacing.sm,
            ),
            child: _CardShimmerItem(),
          ),
        ),
      ),
    );
  }

  /// Creates a kanban board shimmer placeholder.
  factory PlaneLoadingShimmer.kanban({Key? key, int columnCount = 3}) {
    return PlaneLoadingShimmer(
      key: key,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(PlaneSpacing.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            columnCount,
            (_) => const Padding(
              padding: EdgeInsets.only(right: PlaneSpacing.sm),
              child: _KanbanColumnShimmer(),
            ),
          ),
        ),
      ),
    );
  }

  /// Creates a calendar shimmer placeholder.
  factory PlaneLoadingShimmer.calendar({Key? key}) {
    return PlaneLoadingShimmer(
      key: key,
      child: const Padding(
        padding: EdgeInsets.all(PlaneSpacing.md),
        child: Column(
          children: [
            // Month header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ShimmerBox(width: 32, height: 32, isCircle: true),
                _ShimmerBox(width: 140, height: 20),
                _ShimmerBox(width: 32, height: 32, isCircle: true),
              ],
            ),
            SizedBox(height: PlaneSpacing.md),
            // Week day headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ShimmerBox(width: 28, height: 12),
                _ShimmerBox(width: 28, height: 12),
                _ShimmerBox(width: 28, height: 12),
                _ShimmerBox(width: 28, height: 12),
                _ShimmerBox(width: 28, height: 12),
                _ShimmerBox(width: 28, height: 12),
                _ShimmerBox(width: 28, height: 12),
              ],
            ),
            SizedBox(height: PlaneSpacing.sm),
            // Calendar grid (5 rows)
            _CalendarGridRow(),
            SizedBox(height: PlaneSpacing.xs),
            _CalendarGridRow(),
            SizedBox(height: PlaneSpacing.xs),
            _CalendarGridRow(),
            SizedBox(height: PlaneSpacing.xs),
            _CalendarGridRow(),
            SizedBox(height: PlaneSpacing.xs),
            _CalendarGridRow(),
          ],
        ),
      ),
    );
  }

  /// Creates a page tree shimmer placeholder.
  factory PlaneLoadingShimmer.pageTree({Key? key, int itemCount = 6}) {
    return PlaneLoadingShimmer(
      key: key,
      child: Column(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: EdgeInsets.only(
              left: PlaneSpacing.md + (index % 3) * 24,
              right: PlaneSpacing.md,
              top: PlaneSpacing.sm,
              bottom: PlaneSpacing.sm,
            ),
            child: Row(
              children: [
                const _ShimmerBox(width: 20, height: 20),
                const SizedBox(width: PlaneSpacing.sm),
                _ShimmerBox(height: 14, width: 120 + (index % 4) * 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Creates an analytics chart shimmer placeholder.
  factory PlaneLoadingShimmer.chart({Key? key}) {
    return PlaneLoadingShimmer(
      key: key,
      child: const Padding(
        padding: EdgeInsets.all(PlaneSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShimmerBox(height: 20, width: 160),
            SizedBox(height: PlaneSpacing.md),
            _ShimmerBox(height: 200, width: double.infinity),
            SizedBox(height: PlaneSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ShimmerBox(width: 60, height: 12),
                _ShimmerBox(width: 60, height: 12),
                _ShimmerBox(width: 60, height: 12),
                _ShimmerBox(width: 60, height: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a detail view shimmer placeholder.
  factory PlaneLoadingShimmer.detail({Key? key}) {
    return PlaneLoadingShimmer(
      key: key,
      child: const Padding(
        padding: EdgeInsets.all(PlaneSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShimmerBox(height: 24, width: 280),
            SizedBox(height: PlaneSpacing.md),
            _ShimmerBox(height: 14, width: double.infinity),
            SizedBox(height: PlaneSpacing.xs),
            _ShimmerBox(height: 14, width: double.infinity),
            SizedBox(height: PlaneSpacing.xs),
            _ShimmerBox(height: 14, width: 200),
            SizedBox(height: PlaneSpacing.lg),
            Row(
              children: [
                _ShimmerBox(width: 80, height: 32),
                SizedBox(width: PlaneSpacing.sm),
                _ShimmerBox(width: 80, height: 32),
              ],
            ),
            SizedBox(height: PlaneSpacing.lg),
            _ShimmerBox(height: 14, width: 120),
            SizedBox(height: PlaneSpacing.sm),
            _ShimmerBox(height: 60, width: double.infinity),
          ],
        ),
      ),
    );
  }

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = theme.brightness == Brightness.light
        ? PlaneColors.grey200
        : PlaneColors.grey700;
    final highlightColor = theme.brightness == Brightness.light
        ? PlaneColors.grey100
        : PlaneColors.grey600;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: PlaneColors.white,
              borderRadius: borderRadius ?? PlaneRadius.sm,
            ),
          ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    this.width,
    this.height,
    this.isCircle = false,
  });

  final double? width;
  final double? height;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: PlaneColors.white,
        borderRadius: isCircle ? null : PlaneRadius.sm,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }
}

class _CardShimmerItem extends StatelessWidget {
  const _CardShimmerItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(PlaneSpacing.md),
      decoration: BoxDecoration(
        borderRadius: PlaneRadius.md,
        border: Border.all(color: PlaneColors.grey200),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ShimmerBox(height: 14, width: 180),
          SizedBox(height: PlaneSpacing.sm),
          _ShimmerBox(height: 12, width: double.infinity),
          SizedBox(height: PlaneSpacing.sm),
          Row(
            children: [
              _ShimmerBox(width: 60, height: 22),
              SizedBox(width: PlaneSpacing.sm),
              _ShimmerBox(width: 60, height: 22),
              Spacer(),
              _ShimmerBox(width: 22, height: 22, isCircle: true),
            ],
          ),
        ],
      ),
    );
  }
}

class _KanbanColumnShimmer extends StatelessWidget {
  const _KanbanColumnShimmer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Column header
          Padding(
            padding: const EdgeInsets.all(PlaneSpacing.sm),
            child: Row(
              children: [
                const _ShimmerBox(width: 14, height: 14, isCircle: true),
                const SizedBox(width: PlaneSpacing.sm),
                const _ShimmerBox(width: 80, height: 14),
                const Spacer(),
                Container(
                  width: 24,
                  height: 16,
                  decoration: BoxDecoration(
                    color: PlaneColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
          // Cards
          ...List.generate(3, (_) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PlaneSpacing.sm,
                vertical: PlaneSpacing.xs,
              ),
              child: _CardShimmerItem(),
            );
          }),
        ],
      ),
    );
  }
}

class _CalendarGridRow extends StatelessWidget {
  const _CalendarGridRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ShimmerBox(width: 36, height: 36),
        _ShimmerBox(width: 36, height: 36),
        _ShimmerBox(width: 36, height: 36),
        _ShimmerBox(width: 36, height: 36),
        _ShimmerBox(width: 36, height: 36),
        _ShimmerBox(width: 36, height: 36),
        _ShimmerBox(width: 36, height: 36),
      ],
    );
  }
}
