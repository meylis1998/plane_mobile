import 'package:feature_pages/src/providers/page_detail_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_content_provider.g.dart';

/// Provides the raw content string for a page, used by the editor.
@riverpod
Future<String> pageContent(
  Ref ref, {
  required String workspaceSlug,
  required String projectId,
  required String pageId,
}) async {
  final page = await ref.watch(
    pageDetailProvider(
      workspaceSlug: workspaceSlug,
      projectId: projectId,
      pageId: pageId,
    ).future,
  );

  return page.content ?? '';
}
