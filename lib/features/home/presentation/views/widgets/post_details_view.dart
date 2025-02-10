import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/comment_item.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';
import 'package:sketch/translations.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: PostDetailsViewBody(
        post: post,
      ),
    ));
  }
}

class PostDetailsViewBody extends StatelessWidget {
  const PostDetailsViewBody({super.key, required this.post});
  final PostModel post;
  static final TextEditingController commentController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: PostListViewItem(postModel: post)),
              SliverList.builder(
                itemCount: post.comments?.length,
                itemBuilder: (context, index) {
                  final comment = post.comments?[index];
                  return CommentItem(commentModel: comment!);
                },
              ),
            ],
          ),
        ),
        AddComment(commentController: commentController),
      ],
    );
  }
}

class AddComment extends StatelessWidget {
  const AddComment({
    super.key,
    required this.commentController,
  });

  final TextEditingController commentController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        CircleAvatar(
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: CustomTextField(
              controller: commentController,
              hint: AppLocalizations.of(context)!.writeComment,
            ),
          ),
        ),
        SvgPicture.asset(Assets.imagesPaperPlaneRight),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
