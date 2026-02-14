import 'package:domain_core/domain_core.dart' as domain;
import 'package:feature_pages/src/providers/page_mutations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

/// Screen with a form to create a new page.
/// Includes title field, access selector, and create button.
class PageCreateScreen extends ConsumerStatefulWidget {
  const PageCreateScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onCreated,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final void Function(domain.Page page)? onCreated;

  @override
  ConsumerState<PageCreateScreen> createState() => _PageCreateScreenState();
}

class _PageCreateScreenState extends ConsumerState<PageCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  domain.PageAccess _access = domain.PageAccess.public_;
  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isCreating = true);

    final page = domain.Page(
      id: '', // server will assign
      projectId: widget.projectId,
      name: _nameController.text.trim(),
      access: _access,
    );

    final created = await ref
        .read(pageMutationsProvider.notifier)
        .createPage(
          workspaceSlug: widget.workspaceSlug,
          projectId: widget.projectId,
          page: page,
        );

    setState(() => _isCreating = false);

    if (created != null && mounted) {
      widget.onCreated?.call(created);
      Navigator.of(context).pop();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to create page. Please try again.'),
          backgroundColor: PlaneColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Page'),
        actions: [
          TextButton(
            onPressed: _isCreating ? null : _submit,
            child: _isCreating
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Create'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Title
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Page Title',
                hintText: 'e.g. Getting Started Guide',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Page title is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Access selector
            Text(
              'Access',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: PlaneColors.grey600,
                  ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<domain.PageAccess>(
              segments: const [
                ButtonSegment(
                  value: domain.PageAccess.public_,
                  label: Text('Public'),
                  icon: Icon(Icons.public),
                ),
                ButtonSegment(
                  value: domain.PageAccess.private_,
                  label: Text('Private'),
                  icon: Icon(Icons.lock_outline),
                ),
              ],
              selected: {_access},
              onSelectionChanged: (selection) =>
                  setState(() => _access = selection.first),
            ),
            const SizedBox(height: 8),
            Text(
              _access == domain.PageAccess.public_
                  ? 'Anyone in the project can view and edit.'
                  : 'Only you can view and edit.',
              style: const TextStyle(
                fontSize: 13,
                color: PlaneColors.grey500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
