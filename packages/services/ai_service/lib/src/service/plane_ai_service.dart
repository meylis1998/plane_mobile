import 'package:ai_service/src/models/ai_action.dart';
import 'package:ai_service/src/models/ai_response.dart';
import 'package:ai_service/src/models/ai_tone.dart';
import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';

/// Service for AI-powered text operations.
///
/// Calls the Plane AI endpoint (or a configurable AI service URL) to perform
/// text improvement, grammar fixing, summarization, tone adjustment, and
/// description generation.
class PlaneAiService {
  PlaneAiService({
    required PlaneApiClient apiClient,
    String? aiBaseUrl,
  })  : _apiClient = apiClient,
        _aiBaseUrl = aiBaseUrl;

  final PlaneApiClient _apiClient;
  final String? _aiBaseUrl;

  /// Improves the writing quality of [text].
  Future<Either<Failure, AiResponse>> improveText(String text) async {
    return _executeAction(
      text: text,
      action: AiAction.improve,
      prompt: 'Improve the following text for clarity, conciseness, and '
          'readability while preserving the original meaning.',
    );
  }

  /// Fixes grammar errors in [text].
  Future<Either<Failure, AiResponse>> fixGrammar(String text) async {
    return _executeAction(
      text: text,
      action: AiAction.grammar,
      prompt: 'Fix all grammar, spelling, and punctuation errors in the '
          'following text. Only fix errors without changing the meaning '
          'or tone.',
    );
  }

  /// Creates a concise summary of [text].
  Future<Either<Failure, AiResponse>> summarize(String text) async {
    return _executeAction(
      text: text,
      action: AiAction.summarize,
      prompt: 'Summarize the following text into a concise version that '
          'captures the key points.',
    );
  }

  /// Adjusts the tone of [text] to match [tone].
  Future<Either<Failure, AiResponse>> adjustTone(
    String text,
    AiTone tone,
  ) async {
    return _executeAction(
      text: text,
      action: AiAction.tone,
      prompt: 'Rewrite the following text in a ${tone.label.toLowerCase()} '
          'tone while preserving the meaning.',
    );
  }

  /// Generates a work item description from [title].
  Future<Either<Failure, AiResponse>> generateDescription(
    String title,
  ) async {
    return _executeAction(
      text: title,
      action: AiAction.generate,
      prompt: 'Generate a clear and detailed work item description based on '
          'the following title. Include acceptance criteria where '
          'appropriate.',
    );
  }

  Future<Either<Failure, AiResponse>> _executeAction({
    required String text,
    required AiAction action,
    required String prompt,
  }) async {
    try {
      final body = <String, dynamic>{
        'prompt': prompt,
        'text': text,
        'task': action.name,
      };

      final path = _aiBaseUrl != null
          ? '$_aiBaseUrl/api/ai/text-action/'
          : '/api/ai/text-action/';

      final response = await _apiClient.post<Map<String, dynamic>>(
        path,
        data: body,
      );

      final data = response.data;
      final resultText = data['response'] as String? ??
          data['result'] as String? ??
          data['text'] as String? ??
          text;

      return Right(
        AiResponse(
          result: resultText,
          originalText: text,
          action: action,
        ),
      );
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
