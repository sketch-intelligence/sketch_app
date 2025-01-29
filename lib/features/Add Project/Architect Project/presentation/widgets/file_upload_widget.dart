import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadWidget extends StatelessWidget {
  final String? selectedFile;
  final VoidCallback onTap;

  const FileUploadWidget({
    Key? key,
    required this.selectedFile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger file picker on tap
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            selectedFile != null
                ? Image.asset(
                    selectedFile!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.grey,
                  ),
            Text(
              selectedFile != null ? selectedFile! : 'Choose an image',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
