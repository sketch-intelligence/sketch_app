import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sketch/core/functions/select_image.dart';
import 'package:sketch/translations.dart';

class UploadPhotoBottomSheet extends StatefulWidget {
  final Function(File?) whenDone;
  const UploadPhotoBottomSheet({super.key, required this.whenDone});

  @override
  State<UploadPhotoBottomSheet> createState() => _UploadPhotoBottomSheetState();
}

class _UploadPhotoBottomSheetState extends State<UploadPhotoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Wrap(
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close_rounded,
                )),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.camera,
            ),
            leading: const Icon(Icons.camera),
            onTap: () {
              AppFunction.selectOneImage(
                imageSource: ImageSource.camera,
                whenDone: (image) {
                  widget.whenDone(image);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              );
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.gallery,
            ),
            leading: const Icon(Icons.image),
            onTap: () {
              AppFunction.selectOneImage(
                imageSource: ImageSource.gallery,
                whenDone: (image) {
                  widget.whenDone(image);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
