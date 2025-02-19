import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_image_use_case.dart';
import 'package:sketch/features/profile/data/models/profile_model/profile_model.dart';

class ProfileImageWidget extends StatelessWidget {
  final ProfileModel person; // Expect a ProfileModel here
  final bool isOwner;
  const ProfileImageWidget(
      {super.key, required this.person, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width * 0.15; // Adjust size

    // Check if profileImage exists; if not, use a fallback image
    return person.imageUrl != null
        ? GetModel(
            useCaseCallBack: () {
              return GetImageUseCase(homeRepository: HomeRepository()).call(
                params: GetImageParams(
                  imageName: isOwner
                      ? CacheHelper.profileImageUrl ?? ''
                      : person.imageUrl!,
                ),
              );
            },
            onSuccess: (ImageModel image) {},
            errorWidget:
                Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
            modelBuilder: (ImageModel model) {
              return CircleAvatar(
                radius: 26,
                backgroundColor: Colors.grey,
                child: ClipOval(
                  child: person.imageUrl!.endsWith('.svg')
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
          );
  }
}
