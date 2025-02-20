import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/chat/service/real_chat_service.dart';
import 'package:sketch/features/chat_bot/presentation/views/chatpage.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_image_use_case.dart';
import 'package:sketch/features/profile/features/my%20profile/presentation/views/my_profile_view.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.uid});
  final String uid;
  ChatService chatService = ChatService();
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
          child: CacheHelper.profileImageUrl != null
              ? GetModel(
                  useCaseCallBack: () {
                    print('the name : ${CacheHelper.profileImageUrl}');
                    return GetImageUseCase(homeRepository: HomeRepository())
                        .call(
                      params: GetImageParams(
                        imageName: CacheHelper.profileImageUrl!,
                      ),
                    );
                  },
                  onSuccess: (ImageModel image) {},
                  errorWidget: Icon(Icons.image_not_supported,
                      size: 50, color: Colors.grey),
                  modelBuilder: (ImageModel model) {
                    return CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: CacheHelper.userInfo!.user!.imageUrl!
                                .endsWith('.svg')
                            ? SvgPicture.memory(model.imageData)
                            : Image.memory(
                                model.imageData,
                              ),
                      ),
                    );
                  },
                )
              : CircleAvatar(
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
        StreamBuilder<int>(
          stream: chatService.getUnreadMessageCount(uid),
          builder: (context, snapshot) {
            int unreadCount = snapshot.data ?? 0;
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ChatPage();
                    }));
                  },
                  icon: SvgPicture.asset(Assets.imagesChat),
                ),
                if (unreadCount > 0)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        unreadCount.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
