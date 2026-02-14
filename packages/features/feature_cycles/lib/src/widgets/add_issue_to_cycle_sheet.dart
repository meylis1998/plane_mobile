import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:ui_components/ui_components.dart';

/// Search result model for issue search in add-to-cycle sheet.
class CycleIssueSearchResult {
  const CycleIssueSearchResult({
    required this.id,
    required this.name,
    this.identifier,
  });

  final String id;
  final String name;
  final String? identifier;
}

/// A bottom sheet for searching and adding existing issues to a cycle.
class AddIssueToCycleSheet extends StatefulWidget {
  const AddIssueToCycleSheet({
    this.onSearch,
    this.onAdd,
    super.key,
  });

  final Future<List<CycleIssueSearchResult>> Function(String query)?
      onSearch;
  final void Function(String issueId)? onAdd;

  @override
  State<AddIssueToCycleSheet> createState() =>
      _AddIssueToCycleSheetState();
}

class _AddIssueToCycleSheetState extends State<AddIssueToCycleSheet> {
  final _controller = TextEditingController();
  List<CycleIssueSearchResult> _results = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _search(String query) async {
    if (query.trim().isEmpty) {
      setState(() => _results = []);
      return;
    }
    setState(() => _isSearching = true);
    try {
      final results =
          await widget.onSearch?.call(query) ?? [];
      if (mounted) {
        setState(() {
          _results = results;
          _isSearching = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isSearching = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: const BoxDecoration(
                color: PlaneColors.grey300,
                borderRadius: PlaneRadius.full,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(PlaneSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Issues to Cycle',
                    style: PlaneTypography.titleMedium,
                  ),
                  const SizedBox(height: PlaneSpacing.sm),
                  PlaneSearchBar(
                    controller: _controller,
                    hint: 'Search issues...',
                    onChanged: _search,
                  ),
                ],
              ),
            ),
            if (_isSearching)
              const Padding(
                padding: EdgeInsets.all(PlaneSpacing.md),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              Expanded(
                child: _results.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            PlaneSpacing.lg,
                          ),
                          child: Text(
                            _controller.text.isEmpty
                                ? 'Search for issues to add'
                                : 'No issues found',
                            style: PlaneTypography.bodyMedium
                                .copyWith(
                              color: PlaneColors.grey400,
                            ),
                          ),
                        ),
                      )
                    : ListView.separated(
                        controller: scrollController,
                        itemCount: _results.length,
                        separatorBuilder: (_, __) =>
                            const Divider(
                          height: 1,
                          color: PlaneColors.dividerLight,
                        ),
                        itemBuilder: (context, index) {
                          final result = _results[index];
                          return ListTile(
                            title: Text(
                              result.name,
                              style: PlaneTypography.bodyMedium,
                            ),
                            subtitle:
                                result.identifier != null
                                    ? Text(
                                        result.identifier!,
                                        style: PlaneTypography
                                            .labelSmall
                                            .copyWith(
                                          color:
                                              PlaneColors.grey500,
                                        ),
                                      )
                                    : null,
                            trailing: PlaneButton(
                              label: 'Add',
                              variant:
                                  PlaneButtonVariant.text,
                              onPressed: () =>
                                  widget.onAdd?.call(
                                result.id,
                              ),
                            ),
                          );
                        },
                      ),
              ),
          ],
        );
      },
    );
  }
}
