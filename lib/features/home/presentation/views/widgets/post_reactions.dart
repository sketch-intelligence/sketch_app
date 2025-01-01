import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/home/data/models/post_model.dart';

class PostReactions extends StatelessWidget {
  const PostReactions({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostLikes(likesCount: postModel.reactions.length),
        const SizedBox(
          width: 26,
        ),
        PostComments(commentCount: postModel.postComments.length),
        const Spacer(),
        PostShares(shareCount: postModel.shares.length)
      ],
    );
  }
}

class PostComments extends StatelessWidget {
  PostComments({
    super.key,
    required this.commentCount,
  });

  int commentCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesComments,
          color: AppColors.grey3C,
          height: 18,
          width: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(commentCount.toString())
      ],
    );
  }
}

class PostLikes extends StatelessWidget {
  PostLikes({
    super.key,
    required this.likesCount,
  });

  int likesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesLike,
          color: AppColors.grey3C,
          height: 18,
          width: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(likesCount.toString())
      ],
    );
  }
}

class PostShares extends StatelessWidget {
  PostShares({
    super.key,
    required this.shareCount,
  });

  int shareCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesShareNetwork,
          color: AppColors.grey3C,
          height: 18,
          width: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(shareCount.toString())
      ],
    );
  }
}
