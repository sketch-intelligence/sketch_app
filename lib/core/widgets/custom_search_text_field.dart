import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: SvgPicture.asset(
            Assets.imagesSearch,
            width: 20,
            height: 20,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        border: buildOutlineInputBorder(),
        enabledBorder: buildEnabledBorder(),
        focusedBorder: buildFocusedBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    );
  }

  OutlineInputBorder buildEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    );
  }
}
