import 'package:domain_core/domain_core.dart';
import 'package:feature_modules/src/models/module_status.dart';
import 'package:feature_modules/src/providers/module_mutations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

/// Form screen to create a new module with name, description, status,
/// start date, and target date.
class ModuleCreateScreen extends ConsumerStatefulWidget {
  const ModuleCreateScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onCreated,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final void Function(Module module)? onCreated;

  @override
  ConsumerState<ModuleCreateScreen> createState() =>
      _ModuleCreateScreenState();
}

class _ModuleCreateScreenState extends ConsumerState<ModuleCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  ModuleStatus _status = ModuleStatus.planned;
  DateTime? _startDate;
  DateTime? _targetDate;
  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initial = isStart ? _startDate : _targetDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _targetDate = picked;
        }
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isCreating = true);

    final module = Module(
      id: '',
      projectId: widget.projectId,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      status: _status.toApiValue(),
      startDate: _startDate,
      targetDate: _targetDate,
    );

    final created = await ref
        .read(moduleMutationsProvider.notifier)
        .createModule(
          workspaceSlug: widget.workspaceSlug,
          projectId: widget.projectId,
          module: module,
        );

    setState(() => _isCreating = false);

    if (created != null && mounted) {
      widget.onCreated?.call(created);
      Navigator.of(context).pop();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to create module. Please try again.'),
          backgroundColor: PlaneColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Module'),
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
            // Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Module Name',
                hintText: 'e.g. Authentication',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Module name is required';
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
                hintText: 'Optional module description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Status
            Text(
              'Status',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: PlaneColors.grey600,
                  ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<ModuleStatus>(
              initialValue: _status,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: ModuleStatus.values.map((status) {
                return DropdownMenuItem(
                  value: status,
                  child: Row(
                    children: [
                      Icon(status.icon, size: 18, color: status.color),
                      const SizedBox(width: 8),
                      Text(status.label),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _status = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Start Date
            _DateField(
              label: 'Start Date',
              date: _startDate,
              onTap: () => _pickDate(isStart: true),
              onClear: () => setState(() => _startDate = null),
            ),
            const SizedBox(height: 16),

            // Target Date
            _DateField(
              label: 'Target Date',
              date: _targetDate,
              onTap: () => _pickDate(isStart: false),
              onClear: () => setState(() => _targetDate = null),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.date,
    required this.onTap,
    required this.onClear,
  });

  final String label;
  final DateTime? date;
  final VoidCallback onTap;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final displayText = date != null
        ? '${date!.year}'
            '-${date!.month.toString().padLeft(2, '0')}'
            '-${date!.day.toString().padLeft(2, '0')}'
        : 'Select date';

    return InkWell(
      onTap: onTap,
      borderRadius: PlaneRadius.md,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: date != null
              ? IconButton(
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: onClear,
                )
              : const Icon(Icons.calendar_today_outlined, size: 18),
        ),
        child: Text(
          displayText,
          style: TextStyle(
            color: date != null ? null : PlaneColors.grey400,
          ),
        ),
      ),
    );
  }
}
