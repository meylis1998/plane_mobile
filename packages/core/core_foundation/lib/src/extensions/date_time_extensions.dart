/// Convenience extensions on [DateTime].
extension DateTimeExtensions on DateTime {
  /// Returns the date as an ISO 8601 date-only string (yyyy-MM-dd).
  String toIso8601DateOnly() {
    final y = year.toString().padLeft(4, '0');
    final m = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  /// Parses a date string from the API (ISO 8601).
  ///
  /// Falls back to [DateTime.parse] for full ISO 8601 strings.
  static DateTime fromApiString(String value) => DateTime.parse(value);
}
