import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class AssigneeSelector extends StatefulWidget {
  const AssigneeSelector({
    required this.members,
    required this.selectedIds,
    required this.onApply,
    super.key,
  });

  final List<Member> members;
  final List<String> selectedIds;
  final void Function(List<String>) onApply;

  @override
  State<AssigneeSelector> createState() => _AssigneeSelectorState();
}

class _AssigneeSelectorState extends State<AssigneeSelector> {
  late List<String> _selectedIds;

  @override
  void initState() {
    super.initState();
    _selectedIds = List.from(widget.selectedIds);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Select Assignees', style: theme.textTheme.titleMedium),
        ),
        const Divider(height: 1),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.members.length,
            itemBuilder: (context, index) {
              final member = widget.members[index];
              final isSelected = _selectedIds.contains(member.userId);
              return CheckboxListTile(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _selectedIds.add(member.userId);
                    } else {
                      _selectedIds.remove(member.userId);
                    }
                  });
                },
                title: Text(member.displayName),
                subtitle: Text(member.email),
                secondary: CircleAvatar(
                  radius: 16,
                  backgroundColor: PlaneColors.grey200,
                  child: Text(
                    member.displayName.isNotEmpty
                        ? member.displayName[0].toUpperCase()
                        : '?',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                dense: true,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                widget.onApply(_selectedIds);
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ),
        ),
      ],
    );
  }
}
