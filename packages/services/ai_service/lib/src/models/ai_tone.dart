/// Available tones for AI text adjustment.
enum AiTone {
  professional('Professional'),
  casual('Casual'),
  friendly('Friendly'),
  assertive('Assertive'),
  empathetic('Empathetic');

  const AiTone(this.label);

  /// Human-readable label for the tone.
  final String label;
}
