import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AppFunction {
  static Future<void> selectOneImage(
      {required ImageSource imageSource,
      required Function(File?) whenDone}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicker = await picker.pickImage(
      source: imageSource,
      imageQuality: 50,
    );
    if (imagePicker != null) {
      File file = File(imagePicker.path);
      whenDone(file);
    } else {}
  }
}
