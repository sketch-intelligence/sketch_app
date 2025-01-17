import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/my_profile/presentation/views/my_profile_page.dart';
import 'package:sketch/translations.dart';

class TheSecondSection extends StatelessWidget {
  const TheSecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: CustomButton(
            icon: Assets.imagesCheckDouble,
            text: AppLocalizations.of(context)!.connected,
            h: 36,
            w: 136,
            color: Colors.white,
            borderSideColor: const Color(0xff408bc1),
            textStyle: const TextStyle(color: Color(0xff408bc1)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MyProfilePage();
              }));
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            icon: Assets.imagesChatCircleDots,
            text: AppLocalizations.of(context)!.message,
            h: 36,
            w: 136,
            borderSideColor: const Color(0xff408bc1),
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(Assets.imagesDotsThreeVertical),
        ),
      ],
    );
  }
}
