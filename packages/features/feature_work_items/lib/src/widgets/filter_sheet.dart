import 'package:domain_core/domain_core.dart';
import 'package:feature_work_items/src/widgets/state_dot.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({
    required this.selectedStateGroups,
    required this.selectedPriorities,
    required this.selectedAssigneeIds,
    required this.selectedLabelIds,
    required this.members,
    required this.labels,
    required this.onApply,
    super.key,
  });

  final List<StateGroup> selectedStateGroups;
  final List<Priority> selectedPriorities;
  final List<String> selectedAssigneeIds;
  final List<String> selectedLabelIds;
  final List<Member> members;
  final List<Label> labels;
  final void Function({
    required List<StateGroup> stateGroups,
    required List<Priority> priorities,
    required List<String> assigneeIds,
    required List<String> labelIds,
  }) onApply;

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late List<StateGroup> _stateGroups;
  late List<Priority> _priorities;
  late List<String> _assigneeIds;
  late List<String> _labelIds;

  @override
  void initState() {
    super.initState();
    _stateGroups = List.from(widget.selectedStateGroups);
    _priorities = List.from(widget.selectedPriorities);
    _assigneeIds = List.from(widget.selectedAssigneeIds);
    _labelIds = List.from(widget.selectedLabelIds);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text('Filters', style: theme.textTheme.titleMedium),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _stateGroups = [];
                        _priorities = [];
                        _assigneeIds = [];
                        _labelIds = [];
                      });
                    },
                    child: const Text('Clear all'),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  _buildSection(
                    title: 'State',
                    children: StateGroup.values.map((group) {
                      return CheckboxListTile(
                        value: _stateGroups.contains(group),
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _stateGroups.add(group);
                            } else {
                              _stateGroups.remove(group);
                            }
                          });
                        },
                        title: Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: StateDot.colorForGroup(group),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(group.name),
                          ],
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                      );
                    }).toList(),
                  ),
                  _buildSection(
                    title: 'Priority',
                    children: Priority.values.map((priority) {
                      return CheckboxListTile(
                        value: _priorities.contains(priority),
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _priorities.add(priority);
                            } else {
                              _priorities.remove(priority);
                            }
                          });
                        },
                        title: Text(priority.name),
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                      );
                    }).toList(),
                  ),
                  if (widget.members.isNotEmpty)
                    _buildSection(
                      title: 'Assignee',
                      children: widget.members.map((member) {
                        return CheckboxListTile(
                          value: _assigneeIds.contains(member.userId),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                _assigneeIds.add(member.userId);
                              } else {
                                _assigneeIds.remove(member.userId);
                              }
                            });
                          },
                          title: Text(member.displayName),
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                        );
                      }).toList(),
                    ),
                  if (widget.labels.isNotEmpty)
                    _buildSection(
                      title: 'Label',
                      children: widget.labels.map((label) {
                        return CheckboxListTile(
                          value: _labelIds.contains(label.id),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                _labelIds.add(label.id);
                              } else {
                                _labelIds.remove(label.id);
                              }
                            });
                          },
                          title: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: StateDot.parseColor(label.color),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(label.name),
                            ],
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          dense: true,
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    widget.onApply(
                      stateGroups: _stateGroups,
                      priorities: _priorities,
                      assigneeIds: _assigneeIds,
                      labelIds: _labelIds,
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Apply Filters'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: PlaneColors.grey600,
                ),
          ),
        ),
        ...children,
      ],
    );
  }
}
