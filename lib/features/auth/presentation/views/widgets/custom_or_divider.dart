import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: kGreyColor,
            thickness: 1,
            indent: 16,
            endIndent: 8,
          ),
        ),
        const Text(
          "OR",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Divider(
            color: kGreyColor,
            thickness: 1,
            indent: 8,
            endIndent: 16,
          ),
        ),
      ],
    );
  }
}
