import 'package:ai_service/src/models/ai_action.dart';
import 'package:ai_service/src/models/ai_tone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_request.freezed.dart';
part 'ai_request.g.dart';

/// A request to the AI service.
@freezed
class AiRequest with _$AiRequest {
  const factory AiRequest({
    required String text,
    required AiAction action,
    AiTone? tone,
  }) = _AiRequest;

  factory AiRequest.fromJson(Map<String, dynamic> json) =>
      _$AiRequestFromJson(json);
}
