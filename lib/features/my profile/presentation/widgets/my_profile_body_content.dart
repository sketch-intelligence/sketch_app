import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/edit_profile.dart';
import 'package:sketch/features/Add%20Project/Architect%20Project/presentation/views/architect_project.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/features/Post/presentation/views/post_view.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';

class MyProfileBodyContent extends StatelessWidget {
  final ProfileModel profile;
  final GlobalKey _addButtonKey = GlobalKey();

  MyProfileBodyContent({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          profile.person.userName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          profile.bio,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: CustomButton(
                  key: _addButtonKey,
                  icon: Assets.imagesCheckDouble,
                  text: "Add",
                  h: MediaQuery.of(context).size.height * 0.05,
                  w: MediaQuery.of(context).size.width * 0.35,
                  color: Colors.white,
                  borderSideColor: const Color(0xff408bc1),
                  textStyle: TextStyle(
                    color: const Color(0xff408bc1),
                    fontSize: MediaQuery.of(context).size.width * 0.048,
                  ),
                  onPressed: () {
                    _showAddOptions(context);
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  icon: Assets.imagesChatCircleDots,
                  text: "Edit Profile",
                  h: MediaQuery.of(context).size.height * 0.05,
                  w: MediaQuery.of(context).size.width * 0.35,
                  borderSideColor: const Color(0xff408bc1),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.048,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditProfilePage();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _showAddOptions(BuildContext context) async {
    final RenderBox renderBox =
        _addButtonKey.currentContext!.findRenderObject() as RenderBox;
    final Offset buttonPosition = renderBox.localToGlobal(Offset.zero);
    final double buttonWidth = renderBox.size.width;
    final double buttonHeight = renderBox.size.height;

    await showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + buttonHeight,
        buttonPosition.dx + buttonWidth,
        0,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'Post',
          child: Container(
            width: MediaQuery.of(context).size.width * 0.41,
            height: MediaQuery.of(context).size.height * 0.03,
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.imagesNewspaperClipping,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                const Text("Post", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Project',
          child: Container(
            width: MediaQuery.of(context).size.width * 0.41,
            height: MediaQuery.of(context).size.height * 0.03,
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.imagesMeeting,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                const Text("Project", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        if (value == 'Post') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPost()));
        } else if (value == 'Project') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArchitectProject()),
          );
        }
      }
    });
  }
}
