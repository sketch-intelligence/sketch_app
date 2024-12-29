import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.grey3C,
            thickness: 1,
            indent: 16,
            endIndent: 8,
          ),
        ),
        Text(
          "OR",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.grey3C,
            thickness: 1,
            indent: 8,
            endIndent: 16,
          ),
        ),
      ],
    );
  }
}
