import 'dart:io';

import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:dio/dio.dart';
import 'package:domain_core/domain_core.dart';

/// Service for file upload, download, and attachment management.
class PlaneFileService {
  PlaneFileService({required PlaneApiClient apiClient})
      : _apiClient = apiClient;

  final PlaneApiClient _apiClient;

  /// Uploads a file as an attachment to a work item.
  Future<Either<Failure, Attachment>> uploadAttachment({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required File file,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    try {
      final fileName = file.path.split(Platform.pathSeparator).last;
      final formData = FormData.fromMap({
        'asset': await MultipartFile.fromFile(file.path, filename: fileName),
      });

      final response = await _apiClient.uploadFile<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/'
        'work-items/$workItemId/attachments/',
        formData: formData,
        onSendProgress: onSendProgress,
      );

      final data = response.data;
      final attributes = data['attributes'] as Map<String, dynamic>?;

      return Right(
        Attachment(
          id: data['id'] as String? ?? '',
          workItemId: workItemId,
          fileName: attributes?['name'] as String? ?? fileName,
          fileUrl: data['asset'] as String? ?? '',
          fileSize: attributes?['size'] as int?,
          createdAt: data['created_at'] != null
              ? DateTime.tryParse(data['created_at'] as String)
              : null,
        ),
      );
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Fetches the list of attachments for a work item.
  Future<Either<Failure, List<Attachment>>> getAttachments({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
  }) async {
    try {
      final response = await _apiClient.get<List<dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/'
        'work-items/$workItemId/attachments/',
      );

      final attachments = response.data
          .cast<Map<String, dynamic>>()
          .map((json) => _parseAttachment(json, workItemId))
          .toList();

      return Right(attachments);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Fetches a single file asset by ID.
  Future<Either<Failure, Attachment>> getAttachment({
    required String workspaceSlug,
    required String assetId,
  }) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/api/v1/workspaces/$workspaceSlug/file-assets/$assetId/',
      );

      return Right(_parseAttachment(response.data, ''));
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Deletes an attachment from a work item.
  Future<Either<Failure, void>> deleteAttachment({
    required String workspaceSlug,
    required String projectId,
    required String workItemId,
    required String attachmentId,
  }) async {
    try {
      await _apiClient.delete<dynamic>(
        '/api/v1/workspaces/$workspaceSlug/projects/$projectId/'
        'work-items/$workItemId/attachments/$attachmentId/',
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Downloads a file from [url] to [savePath].
  Future<Either<Failure, File>> downloadFile({
    required String url,
    required String savePath,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    try {
      await _apiClient.dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      return Right(File(savePath));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Download failed'));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Attachment _parseAttachment(Map<String, dynamic> json, String workItemId) {
    final attributes = json['attributes'] as Map<String, dynamic>?;
    return Attachment(
      id: json['id'] as String? ?? '',
      workItemId: json['work_item'] as String? ?? workItemId,
      fileName:
          attributes?['name'] as String? ??
          json['asset'] as String? ??
          '',
      fileUrl: json['asset'] as String? ?? '',
      fileSize: attributes?['size'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
    );
  }
}
