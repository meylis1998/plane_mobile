import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    required this.label,
    this.selectedDate,
    this.onDateSelected,
    this.onClear,
    this.firstDate,
    this.lastDate,
    super.key,
  });

  final String label;
  final DateTime? selectedDate;
  final void Function(DateTime)? onDateSelected;
  final VoidCallback? onClear;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(2020),
          lastDate: lastDate ?? DateTime(2030),
        );
        if (picked != null) {
          onDateSelected?.call(picked);
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          suffixIcon: selectedDate != null && onClear != null
              ? IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  onPressed: onClear,
                )
              : const Icon(Icons.calendar_today, size: 18),
        ),
        child: Text(
          selectedDate != null
              ? formatDate(selectedDate!)
              : 'Select date',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: selectedDate != null
                ? PlaneColors.textPrimaryLight
                : PlaneColors.textTertiaryLight,
          ),
        ),
      ),
    );
  }

  static String formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
