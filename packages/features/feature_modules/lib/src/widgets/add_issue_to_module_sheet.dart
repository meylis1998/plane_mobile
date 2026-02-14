import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Bottom sheet to search and add work items to a module.
class AddIssueToModuleSheet extends StatefulWidget {
  const AddIssueToModuleSheet({
    required this.availableIssues,
    required this.onAdd,
    super.key,
  });

  final List<WorkItem> availableIssues;
  final void Function(List<WorkItem> selected) onAdd;

  static Future<void> show({
    required BuildContext context,
    required List<WorkItem> availableIssues,
    required void Function(List<WorkItem> selected) onAdd,
  }) {
    return PlaneBottomSheet.show<void>(
      context: context,
      title: 'Add Issues',
      child: AddIssueToModuleSheet(
        availableIssues: availableIssues,
        onAdd: onAdd,
      ),
    );
  }

  @override
  State<AddIssueToModuleSheet> createState() => _AddIssueToModuleSheetState();
}

class _AddIssueToModuleSheetState extends State<AddIssueToModuleSheet> {
  final _searchController = TextEditingController();
  final _selectedIds = <String>{};
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<WorkItem> get _filteredIssues {
    if (_query.isEmpty) return widget.availableIssues;
    final q = _query.toLowerCase();
    return widget.availableIssues
        .where((item) => item.name.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredIssues;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search issues...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: PlaneSpacing.md,
                vertical: PlaneSpacing.sm,
              ),
            ),
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: PlaneSpacing.sm),
          Expanded(
            child: filtered.isEmpty
                ? const PlaneEmptyState(
                    title: 'No matching issues',
                    icon: Icons.search_off,
                  )
                : ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      final isSelected = _selectedIds.contains(item.id);
                      return CheckboxListTile(
                        dense: true,
                        value: isSelected,
                        title: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: PlaneTypography.bodyMedium,
                        ),
                        onChanged: (checked) {
                          setState(() {
                            if (checked ?? false) {
                              _selectedIds.add(item.id);
                            } else {
                              _selectedIds.remove(item.id);
                            }
                          });
                        },
                      );
                    },
                  ),
          ),
          const SizedBox(height: PlaneSpacing.sm),
          PlaneButton(
            label: 'Add ${_selectedIds.length} '
                'issue${_selectedIds.length == 1 ? '' : 's'}',
            isExpanded: true,
            isDisabled: _selectedIds.isEmpty,
            onPressed: () {
              final selected = widget.availableIssues
                  .where((item) => _selectedIds.contains(item.id))
                  .toList();
              widget.onAdd(selected);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
