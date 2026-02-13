/// Convenience extensions on [String].
extension StringExtensions on String {
  /// Capitalizes the first character of this string.
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Truncates this string to [maxLength] characters, appending [ellipsis]
  /// if truncated.
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$ellipsis';
  }
}
