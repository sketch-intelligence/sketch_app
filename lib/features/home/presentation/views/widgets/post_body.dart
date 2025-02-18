import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_image_use_case.dart';

class PostBody extends StatelessWidget {
  PostBody({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.kPostDetailsView, extra: postModel);
            },
            child: Text(postModel.text ?? '')),
        SizedBox(
          height: postModel.text != null ? 6 : 0,
        ),
        postModel.images != null
            ? postModel.images!.isNotEmpty
                ? GetModel(
                    useCaseCallBack: () {
                      print(
                          'the file file is ${postModel.images![0].fileName}');
                      return GetImageUseCase(homeRepository: HomeRepository())
                          .call(
                              params: GetImageParams(
                                  imageName: postModel.images![0].fileName!));
                    },
                    onSuccess: (ImageModel image) {},
                    errorWidget: Icon(Icons.image_not_supported,
                        size: 50, color: Colors.grey),
                    modelBuilder: (ImageModel model) {
                      return Image.memory(model.imageData);
                    },
                  )
                : SizedBox()
            : SizedBox()
      ],
    );
  }
}
