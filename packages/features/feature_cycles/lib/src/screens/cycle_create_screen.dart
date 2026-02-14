import 'package:domain_core/domain_core.dart';
import 'package:feature_cycles/src/providers/cycle_mutations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

/// A screen with a form to create a new cycle.
/// Fields: name, description, start date, end date.
/// Validation: end date must be after start date.
class CycleCreateScreen extends ConsumerStatefulWidget {
  const CycleCreateScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.onCreated,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final void Function(Cycle cycle)? onCreated;

  @override
  ConsumerState<CycleCreateScreen> createState() => _CycleCreateScreenState();
}

class _CycleCreateScreenState extends ConsumerState<CycleCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final initial = isStart
        ? (_startDate ?? now)
        : (_endDate ?? _startDate?.add(const Duration(days: 14)) ?? now);
    final firstDate = isStart
        ? now.subtract(const Duration(days: 365))
        : (_startDate ?? now);

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: firstDate,
      lastDate: now.add(const Duration(days: 365 * 2)),
    );
    if (picked != null && mounted) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          // Auto-clear end date if it's before new start date
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = null;
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both start and end dates.'),
          backgroundColor: PlaneColors.warning,
        ),
      );
      return;
    }

    setState(() => _isCreating = true);

    final cycle = Cycle(
      id: '',
      projectId: widget.projectId,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      startDate: _startDate,
      endDate: _endDate,
      status: CycleStatus.draft,
    );

    final result = await ref
        .read(cycleMutationsProvider.notifier)
        .createCycle(
          workspaceSlug: widget.workspaceSlug,
          projectId: widget.projectId,
          cycle: cycle,
        );

    setState(() => _isCreating = false);

    result.fold(
      (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to create cycle. Please try again.'),
              backgroundColor: PlaneColors.error,
            ),
          );
        }
      },
      (created) {
        if (mounted) {
          widget.onCreated?.call(created);
          Navigator.of(context).pop();
        }
      },
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Cycle'),
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
                labelText: 'Cycle Name',
                hintText: 'e.g. Sprint 1',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Cycle name is required';
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
                hintText: 'Optional description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Start date
            Text(
              'Start Date',
              style: theme.textTheme.titleSmall?.copyWith(
                color: PlaneColors.grey600,
              ),
            ),
            const SizedBox(height: 8),
            _DatePickerTile(
              date: _startDate,
              placeholder: 'Select start date',
              onTap: () => _pickDate(isStart: true),
              formatDate: _formatDate,
            ),
            const SizedBox(height: 16),

            // End date
            Text(
              'End Date',
              style: theme.textTheme.titleSmall?.copyWith(
                color: PlaneColors.grey600,
              ),
            ),
            const SizedBox(height: 8),
            _DatePickerTile(
              date: _endDate,
              placeholder: 'Select end date',
              onTap: () => _pickDate(isStart: false),
              formatDate: _formatDate,
              error: _startDate != null &&
                      _endDate != null &&
                      !_endDate!.isAfter(_startDate!)
                  ? 'End date must be after start date'
                  : null,
            ),

            if (_startDate != null && _endDate != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: PlaneColors.infoLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 18,
                      color: PlaneColors.info,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Duration: '
                      '${_endDate!.difference(_startDate!).inDays}'
                      ' days',
                      style: PlaneTypography.bodySmall.copyWith(
                        color: PlaneColors.info,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DatePickerTile extends StatelessWidget {
  const _DatePickerTile({
    required this.placeholder,
    required this.onTap,
    required this.formatDate,
    this.date,
    this.error,
  });

  final DateTime? date;
  final String placeholder;
  final VoidCallback onTap;
  final String Function(DateTime) formatDate;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: error != null ? PlaneColors.error : PlaneColors.grey300,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 18,
                  color: date != null
                      ? PlaneColors.grey700
                      : PlaneColors.grey400,
                ),
                const SizedBox(width: 12),
                Text(
                  date != null ? formatDate(date!) : placeholder,
                  style: TextStyle(
                    fontSize: 15,
                    color: date != null
                        ? PlaneColors.grey800
                        : PlaneColors.grey400,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 4),
          Text(
            error!,
            style: PlaneTypography.labelSmall.copyWith(
              color: PlaneColors.error,
            ),
          ),
        ],
      ],
    );
  }
}
