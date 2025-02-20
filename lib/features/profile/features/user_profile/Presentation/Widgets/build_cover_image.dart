import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_image_use_case.dart';

class CoverImageWidget extends StatelessWidget {
  final String? imageUrl;

  const CoverImageWidget({super.key, this.imageUrl});
//udpate here
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        child: imageUrl?.isEmpty ?? true
            ? Image.asset(
                Assets.imagesBgDots,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    imageUrl!, // Fallback if network fails
                    fit: BoxFit.cover,
                  );
                },
              )
            : GetModel(
                useCaseCallBack: () {
                  return GetImageUseCase(homeRepository: HomeRepository()).call(
                    params: GetImageParams(imageName: imageUrl!),
                  );
                },
                onSuccess: (ImageModel image) {},
                errorWidget: Icon(Icons.image_not_supported,
                    size: 50, color: Colors.grey),
                modelBuilder: (ImageModel model) {
                  return imageUrl!.endsWith('.svg')
                      ? SvgPicture.memory(
                          model.imageData,
                          fit: BoxFit.fill,
                        )
                      : Image.memory(
                          model.imageData,
                          fit: BoxFit.fill,
                        );
                },
              ));
  }
}
