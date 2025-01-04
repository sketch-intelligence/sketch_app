import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.label,
      this.hint,
      this.isObscure = false,
      this.validator,
      this.iconPath,
      this.isBig = false,
      this.suffixIcon});

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool isObscure;
  final String? Function(String?)? validator;
  final String? iconPath;
  final bool? isBig;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: isBig! ? 3 : 1,
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
          suffixIcon: suffixIcon),
      obscureText: isObscure,
      validator: validator,
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
    );
  }

  OutlineInputBorder buildEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.grey3C,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.grey3C,
      ),
    );
  }
}
