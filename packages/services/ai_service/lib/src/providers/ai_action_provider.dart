import 'package:ai_service/src/models/ai_action.dart';
import 'package:ai_service/src/models/ai_response.dart';
import 'package:ai_service/src/models/ai_tone.dart';
import 'package:ai_service/src/providers/ai_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_action_provider.g.dart';

/// Manages AI action execution with loading state.
///
/// The state holds the most recent [AiResponse] or null when idle.
@riverpod
class AiActionNotifier extends _$AiActionNotifier {
  @override
  AsyncValue<AiResponse?> build() => const AsyncData(null);

  /// Executes the given AI [action] on [text].
  ///
  /// For [AiAction.tone], provide the desired [tone].
  Future<void> execute({
    required String text,
    required AiAction action,
    AiTone? tone,
  }) async {
    state = const AsyncLoading();

    final service = ref.read(aiServiceProvider);
    final result = switch (action) {
      AiAction.improve => await service.improveText(text),
      AiAction.grammar => await service.fixGrammar(text),
      AiAction.summarize => await service.summarize(text),
      AiAction.tone =>
        await service.adjustTone(text, tone ?? AiTone.professional),
      AiAction.generate => await service.generateDescription(text),
    };

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      AsyncData.new,
    );
  }

  /// Resets the state to idle.
  void reset() {
    state = const AsyncData(null);
  }
}
