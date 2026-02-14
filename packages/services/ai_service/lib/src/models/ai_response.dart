import 'package:ai_service/src/models/ai_action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_response.freezed.dart';
part 'ai_response.g.dart';

/// The result returned from the AI service.
@freezed
class AiResponse with _$AiResponse {
  const factory AiResponse({
    required String result,
    required String originalText,
    required AiAction action,
  }) = _AiResponse;

  factory AiResponse.fromJson(Map<String, dynamic> json) =>
      _$AiResponseFromJson(json);
}
