// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadProgressImpl _$$UploadProgressImplFromJson(Map<String, dynamic> json) =>
    _$UploadProgressImpl(
      fileName: json['fileName'] as String,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      isComplete: json['isComplete'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$UploadProgressImplToJson(
  _$UploadProgressImpl instance,
) => <String, dynamic>{
  'fileName': instance.fileName,
  'progress': instance.progress,
  'isComplete': instance.isComplete,
  'error': instance.error,
};
