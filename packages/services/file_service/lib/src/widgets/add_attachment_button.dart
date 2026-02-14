import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:theme/theme.dart';

/// A button that opens a bottom sheet with file_picker / image_picker
/// options, then invokes [onFilePicked] with the selected file.
class AddAttachmentButton extends StatelessWidget {
  const AddAttachmentButton({
    required this.onFilePicked,
    super.key,
  });

  final void Function(File file) onFilePicked;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _showPickerSheet(context),
      icon: const Icon(Icons.attach_file, size: 18),
      label: const Text('Add attachment'),
      style: OutlinedButton.styleFrom(
        foregroundColor: PlaneColors.primary,
        side: const BorderSide(color: PlaneColors.borderLight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }

  void _showPickerSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: PlaneColors.grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(ctx);
                _pickImage(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Take a photo'),
              onTap: () {
                Navigator.pop(ctx);
                _takePhoto(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file_outlined),
              title: const Text('Browse files'),
              onTap: () {
                Navigator.pop(ctx);
                _pickFile();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      onFilePicked(File(xFile.path));
    }
  }

  Future<void> _takePhoto(BuildContext context) async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      onFilePicked(File(xFile.path));
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      onFilePicked(File(result.files.single.path!));
    }
  }
}
