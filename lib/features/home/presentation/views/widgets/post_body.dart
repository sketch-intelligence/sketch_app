import 'package:flutter/material.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';

class PostBody extends StatelessWidget {
  const PostBody({
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
        Text(postModel.text ?? ''),
        SizedBox(
          height: postModel.text != null ? 6 : 0,
        ),
        // postModel.images?[0] != null
        //     ? Image.asset(postModel.images!.elementAt(0).downloadUrl ??
        //         Assets.imagesImage)
        //     : Image.asset(Assets.imagesImage)
      ],
    );
  }
}
