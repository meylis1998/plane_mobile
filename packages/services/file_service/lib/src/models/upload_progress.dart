import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_progress.freezed.dart';
part 'upload_progress.g.dart';

@freezed
class UploadProgress with _$UploadProgress {
  const factory UploadProgress({
    required String fileName,
    @Default(0.0) double progress,
    @Default(false) bool isComplete,
    String? error,
  }) = _UploadProgress;

  factory UploadProgress.fromJson(Map<String, dynamic> json) =>
      _$UploadProgressFromJson(json);
}
