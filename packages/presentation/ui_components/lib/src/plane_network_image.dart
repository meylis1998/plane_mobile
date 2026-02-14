import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A network image widget backed by [CachedNetworkImage].
///
/// Provides automatic disk caching, a shimmer placeholder, an error fallback,
/// and a configurable fade-in animation.
class PlaneNetworkImage extends StatelessWidget {
  const PlaneNetworkImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.memCacheWidth,
    this.memCacheHeight,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    super.key,
  });

  /// The URL of the image to load and cache.
  final String imageUrl;

  /// Optional fixed width.
  final double? width;

  /// Optional fixed height.
  final double? height;

  /// How the image should be inscribed into the space.
  /// Defaults to [BoxFit.cover].
  final BoxFit fit;

  /// Optional border radius applied via [ClipRRect].
  final BorderRadius? borderRadius;

  /// Custom placeholder widget shown while loading.
  /// Falls back to a grey container with a centered progress indicator.
  final Widget? placeholder;

  /// Custom error widget shown on failure.
  /// Falls back to a grey container with a broken-image icon.
  final Widget? errorWidget;

  /// Duration of the fade-in animation. Defaults to 300ms.
  final Duration fadeInDuration;

  /// Resize the image in memory to this width to reduce memory usage.
  final int? memCacheWidth;

  /// Resize the image in memory to this height to reduce memory usage.
  final int? memCacheHeight;

  /// Max width when storing to disk cache.
  final int? maxWidthDiskCache;

  /// Max height when storing to disk cache.
  final int? maxHeightDiskCache;

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      fadeInDuration: fadeInDuration,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      maxWidthDiskCache: maxWidthDiskCache,
      maxHeightDiskCache: maxHeightDiskCache,
      placeholder: (context, url) =>
          placeholder ?? _DefaultPlaceholder(width: width, height: height),
      errorWidget: (context, url, error) =>
          errorWidget ?? _DefaultError(width: width, height: height),
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}

class _DefaultPlaceholder extends StatelessWidget {
  const _DefaultPlaceholder({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: PlaneColors.grey100,
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

class _DefaultError extends StatelessWidget {
  const _DefaultError({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: PlaneColors.grey100,
      child: const Center(
        child: Icon(
          Icons.broken_image_outlined,
          color: PlaneColors.grey400,
          size: 24,
        ),
      ),
    );
  }
}
