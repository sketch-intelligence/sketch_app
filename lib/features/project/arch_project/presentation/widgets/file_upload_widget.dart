import 'dart:io';

import 'package:flutter/material.dart';

class FileUploadWidget extends StatelessWidget {
  final File? selectedFile;
  final VoidCallback onTap;

  const FileUploadWidget({
    super.key,
    required this.selectedFile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger file picker on tap
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            selectedFile != null
                ? Image.file(
                    selectedFile!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : const Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.grey,
                  ),
            Text(
              selectedFile?.path != null ? '' : 'Choose an image',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
