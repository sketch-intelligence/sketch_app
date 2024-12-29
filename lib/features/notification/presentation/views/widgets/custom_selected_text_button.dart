import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isSelected});
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.grey3C,
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
