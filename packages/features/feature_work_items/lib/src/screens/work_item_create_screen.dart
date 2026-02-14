import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/providers/project_labels_provider.dart';
import 'package:feature_work_items/src/providers/project_members_provider.dart';
import 'package:feature_work_items/src/providers/project_states_provider.dart';
import 'package:feature_work_items/src/providers/work_item_list_provider.dart';
import 'package:feature_work_items/src/providers/work_item_mutations_provider.dart';
import 'package:feature_work_items/src/widgets/assignee_selector.dart';
import 'package:feature_work_items/src/widgets/date_picker_field.dart';
import 'package:feature_work_items/src/widgets/label_selector.dart';
import 'package:feature_work_items/src/widgets/parent_issue_selector.dart';
import 'package:feature_work_items/src/widgets/priority_icon.dart';
import 'package:feature_work_items/src/widgets/priority_selector.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:feature_work_items/src/widgets/state_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme.dart';

class WorkItemCreateScreen extends ConsumerStatefulWidget {
  const WorkItemCreateScreen({
    required this.workspaceSlug,
    required this.projectId,
    this.projectIdentifier,
    this.onCreated,
    super.key,
  });

  final String workspaceSlug;
  final String projectId;
  final String? projectIdentifier;
  final void Function(WorkItem)? onCreated;

  @override
  ConsumerState<WorkItemCreateScreen> createState() =>
      _WorkItemCreateScreenState();
}

class _WorkItemCreateScreenState extends ConsumerState<WorkItemCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  WorkItemState? _selectedState;
  Priority _selectedPriority = Priority.none;
  List<String> _selectedAssigneeIds = [];
  List<String> _selectedLabelIds = [];
  DateTime? _startDate;
  DateTime? _targetDate;
  String? _parentId;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mutationState = ref.watch(workItemMutationsProvider);
    final statesAsync = ref.watch(
      projectStatesNotifierProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
      ),
    );
    final labelsAsync = ref.watch(
      projectLabelsNotifierProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
      ),
    );
    final membersAsync = ref.watch(
      projectMembersNotifierProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
      ),
    );

    final states = statesAsync.valueOrNull ?? [];
    final labels = labelsAsync.valueOrNull ?? [];
    final members = membersAsync.valueOrNull ?? [];

    // Set default state if not yet set
    if (_selectedState == null && states.isNotEmpty) {
      _selectedState = states.first;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Work Item'),
        actions: [
          TextButton(
            onPressed: mutationState.isLoading ? null : _submit,
            child: mutationState.isLoading
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
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter work item title',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Add a description...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(height: 24),

            // State
            _buildSelectorTile(
              label: 'State',
              child: _selectedState != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StateDot(state: _selectedState!),
                        const SizedBox(width: 6),
                        Text(_selectedState!.name),
                      ],
                    )
                  : Text(
                      'Select state',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: PlaneColors.textTertiaryLight,
                      ),
                    ),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (_) => StateSelector(
                    states: states,
                    selectedStateId: _selectedState?.id,
                    onSelected: (s) => setState(() => _selectedState = s),
                  ),
                );
              },
            ),
            const Divider(height: 1),

            // Priority
            _buildSelectorTile(
              label: 'Priority',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PriorityIcon(priority: _selectedPriority),
                  const SizedBox(width: 6),
                  Text(PriorityIcon.label(_selectedPriority)),
                ],
              ),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (_) => PrioritySelector(
                    selectedPriority: _selectedPriority,
                    onSelected: (p) =>
                        setState(() => _selectedPriority = p),
                  ),
                );
              },
            ),
            const Divider(height: 1),

            // Assignees
            _buildSelectorTile(
              label: 'Assignees',
              child: _selectedAssigneeIds.isEmpty
                  ? Text(
                      'None',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: PlaneColors.textTertiaryLight,
                      ),
                    )
                  : Text('${_selectedAssigneeIds.length} selected'),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: AssigneeSelector(
                      members: members,
                      selectedIds: _selectedAssigneeIds,
                      onApply: (ids) =>
                          setState(() => _selectedAssigneeIds = ids),
                    ),
                  ),
                );
              },
            ),
            const Divider(height: 1),

            // Labels
            _buildSelectorTile(
              label: 'Labels',
              child: _selectedLabelIds.isEmpty
                  ? Text(
                      'None',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: PlaneColors.textTertiaryLight,
                      ),
                    )
                  : Text('${_selectedLabelIds.length} selected'),
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: LabelSelector(
                      labels: labels,
                      selectedIds: _selectedLabelIds,
                      onApply: (ids) =>
                          setState(() => _selectedLabelIds = ids),
                    ),
                  ),
                );
              },
            ),
            const Divider(height: 1),

            const SizedBox(height: 16),

            // Dates
            Row(
              children: [
                Expanded(
                  child: DatePickerField(
                    label: 'Start Date',
                    selectedDate: _startDate,
                    onDateSelected: (d) => setState(() => _startDate = d),
                    onClear: () => setState(() => _startDate = null),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DatePickerField(
                    label: 'Due Date',
                    selectedDate: _targetDate,
                    onDateSelected: (d) => setState(() => _targetDate = d),
                    onClear: () => setState(() => _targetDate = null),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Parent Issue
            _buildSelectorTile(
              label: 'Parent Issue',
              child: _parentId != null
                  ? Text('Selected')
                  : Text(
                      'None',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: PlaneColors.textTertiaryLight,
                      ),
                    ),
              onTap: () => _showParentSelector(context),
            ),

            // Error display
            if (mutationState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Error: ${mutationState.error}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: PlaneColors.error,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectorTile({
    required String label,
    required Widget child,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: PlaneColors.textSecondaryLight,
                    ),
              ),
            ),
            Expanded(child: child),
            const Icon(Icons.chevron_right, color: PlaneColors.grey400),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedState == null) return;

    final workItem = WorkItem(
      id: '',
      projectId: widget.projectId,
      workspaceSlug: widget.workspaceSlug,
      name: _titleController.text.trim(),
      description: _descriptionController.text.trim().isNotEmpty
          ? _descriptionController.text.trim()
          : null,
      state: _selectedState!,
      priority: _selectedPriority,
      assigneeIds:
          _selectedAssigneeIds.isNotEmpty ? _selectedAssigneeIds : null,
      labelIds: _selectedLabelIds.isNotEmpty ? _selectedLabelIds : null,
      startDate: _startDate,
      targetDate: _targetDate,
      parentId: _parentId,
    );

    final result =
        await ref.read(workItemMutationsProvider.notifier).createWorkItem(
              workspaceSlug: widget.workspaceSlug,
              projectId: widget.projectId,
              workItem: workItem,
            );

    result.fold(
      (_) {},
      (created) {
        widget.onCreated?.call(created);
        if (mounted) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  void _showParentSelector(BuildContext context) {
    final itemsAsync = ref.read(
      workItemListProvider(
        workspaceSlug: widget.workspaceSlug,
        projectId: widget.projectId,
      ),
    );
    final items = itemsAsync.valueOrNull ?? [];
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ParentIssueSelector(
        workItems: items,
        selectedParentId: _parentId,
        projectIdentifier: widget.projectIdentifier,
        onSelected: (id) => setState(() => _parentId = id),
      ),
    );
  }
}
