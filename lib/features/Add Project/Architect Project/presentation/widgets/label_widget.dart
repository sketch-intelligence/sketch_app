// lib/features/Add Project/Architect Project/widgets/label_widget.dart
import 'package:flutter/material.dart';
import 'package:sketch/core/constant/text_styles/app_text_style.dart';
import 'package:sketch/core/constant/text_styles/font_size.dart';

class LabelWidget extends StatelessWidget {
  final String text;

  const LabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: AppTextStyle.getMediumStyle(
          fontSize: AppFontSize.size_14,
          color: Colors.black87,
        ),
      ),
    );
  }
}
