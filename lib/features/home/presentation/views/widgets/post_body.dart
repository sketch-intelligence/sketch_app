import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/features/home/presentation/data/models/post_model.dart';

class PostBody extends StatelessWidget {
  const PostBody({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(postModel.text ?? ''),
          ],
        ),
        SizedBox(
          height: postModel.text != null ? 6 : 0,
        ),
        postModel.image != null
            ? Image.asset(postModel.image!)
            : Image.asset(Assets.imagesImage)
      ],
    );
  }
}
