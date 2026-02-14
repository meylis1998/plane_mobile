import 'package:domain_core/domain_core.dart';
import 'package:feature_project/src/providers/project_mutations_provider.dart';
import 'package:feature_project/src/widgets/emoji_picker_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

/// A screen with a form to create a new project.
/// Auto-generates an identifier from the project name.
class ProjectCreateScreen extends ConsumerStatefulWidget {
  const ProjectCreateScreen({
    required this.workspaceSlug,
    required this.workspaceId,
    this.onCreated,
    super.key,
  });

  final String workspaceSlug;
  final String workspaceId;
  final void Function(Project project)? onCreated;

  @override
  ConsumerState<ProjectCreateScreen> createState() =>
      _ProjectCreateScreenState();
}

class _ProjectCreateScreenState extends ConsumerState<ProjectCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _identifierController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedEmoji;
  ProjectNetwork _network = ProjectNetwork.private_;
  bool _isCreating = false;
  bool _identifierManuallyEdited = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_autoGenerateIdentifier);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _identifierController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _autoGenerateIdentifier() {
    if (_identifierManuallyEdited) return;
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      _identifierController.text = '';
      return;
    }

    // Take first letters of up to 3 words, then pad with remaining chars
    final words = name
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();
    String identifier;
    if (words.length >= 3) {
      identifier = words.take(3).map((w) => w[0]).join();
    } else if (words.length == 2) {
      final len = 2.clamp(0, words[1].length);
      identifier =
          '${words[0][0]}${words[1].substring(0, len)}';
    } else {
      identifier = name.substring(0, name.length.clamp(0, 3));
    }
    _identifierController.text = identifier.toUpperCase();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isCreating = true);

    final project = Project(
      id: '', // server will assign
      workspaceId: widget.workspaceId,
      name: _nameController.text.trim(),
      identifier: _identifierController.text.trim().toUpperCase(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      emoji: _selectedEmoji,
      network: _network,
    );

    final created = await ref
        .read(projectMutationsProvider.notifier)
        .createProject(
          workspaceSlug: widget.workspaceSlug,
          project: project,
        );

    setState(() => _isCreating = false);

    if (created != null && mounted) {
      widget.onCreated?.call(created);
      Navigator.of(context).pop();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to create project. Please try again.'),
          backgroundColor: PlaneColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Project'),
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
            // Emoji picker
            Text(
              'Emoji',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: PlaneColors.grey600,
                  ),
            ),
            const SizedBox(height: 8),
            EmojiPickerGrid(
              selectedEmoji: _selectedEmoji,
              onEmojiSelected: (emoji) =>
                  setState(() => _selectedEmoji = emoji),
            ),
            const SizedBox(height: 20),

            // Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Project Name',
                hintText: 'e.g. Mobile App',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Project name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Identifier
            TextFormField(
              controller: _identifierController,
              decoration: const InputDecoration(
                labelText: 'Identifier',
                hintText: 'e.g. MOB',
                border: OutlineInputBorder(),
                helperText: 'Auto-generated from name. 2-5 characters.',
              ),
              textCapitalization: TextCapitalization.characters,
              onChanged: (_) => _identifierManuallyEdited = true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Identifier is required';
                }
                if (value.trim().length < 2 || value.trim().length > 5) {
                  return 'Must be 2-5 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Optional project description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Network
            Text(
              'Network',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: PlaneColors.grey600,
                  ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<ProjectNetwork>(
              segments: const [
                ButtonSegment(
                  value: ProjectNetwork.private_,
                  label: Text('Private'),
                  icon: Icon(Icons.lock_open_outlined),
                ),
                ButtonSegment(
                  value: ProjectNetwork.secret,
                  label: Text('Secret'),
                  icon: Icon(Icons.lock_outline),
                ),
              ],
              selected: {_network},
              onSelectionChanged: (selection) =>
                  setState(() => _network = selection.first),
            ),
          ],
        ),
      ),
    );
  }
}
