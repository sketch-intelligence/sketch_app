import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/Chat/presentation/views/chatpage.dart';
import 'package:sketch/features/my%20profile/presentation/views/my_profile_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyProfilePage(
                        userId: CacheHelper.userID ?? 0,
                      )),
            );
          },
          child: CircleAvatar(
            radius: 26,
            foregroundImage: const NetworkImage(dummyProfileImage),
            backgroundColor: Colors.grey,
            child: ClipOval(
              child: Image.network(
                dummyProfileImage,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Expanded(
          child: SearchTextField(),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kNotificationView);
          },
          icon: SvgPicture.asset(Assets.imagesBell),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ChatPage();
            }));
          },
          icon: SvgPicture.asset(Assets.imagesChat),
        ),
      ],
    );
  }
}
