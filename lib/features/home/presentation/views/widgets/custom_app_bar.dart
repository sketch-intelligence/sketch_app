import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/home/presentation/views/widgets/user_image_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserImageContainer(imagePath: Assets.imagesAvatar13),
        const SizedBox(
          width: 8,
        ),
        const Expanded(
          child: SearchTextField(),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.imagesBell),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.imagesChat),
        ),
      ],
    );
  }
}
