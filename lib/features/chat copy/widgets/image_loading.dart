import 'dart:io';

import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading({required this.imageFile, super.key});
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.file(imageFile!),
        const Positioned(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}
