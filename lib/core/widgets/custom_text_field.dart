import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.obscureText = false,
    this.validator,
    this.iconPath,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle:
            AppStyles.styleRegular16(context).copyWith(color: Colors.black),
        prefixIcon: iconPath != null
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: SvgPicture.asset(
                  iconPath!,
                  width: 20,
                  height: 20,
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: buildOutlineInputBorder(),
        enabledBorder: buildEnabledBorder(),
        focusedBorder: buildFocusedBorder(),
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: kPrimaryColor,
      ),
    );
  }

  OutlineInputBorder buildEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kGreyColor,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: kGreyColor,
      ),
    );
  }
}
