/// The type of AI action to perform.
enum AiAction {
  improve('Improve Writing'),
  grammar('Fix Grammar'),
  summarize('Summarize'),
  tone('Adjust Tone'),
  generate('Generate Description');

  const AiAction(this.label);

  /// Human-readable label for the action.
  final String label;
}
