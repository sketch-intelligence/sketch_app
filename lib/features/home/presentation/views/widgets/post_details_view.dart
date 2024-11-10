import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/utils/app_assets.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/home/presentation/data/models/post_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/comment_item.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';
import 'package:sketch/features/home/presentation/views/widgets/user_image_container.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PostDetailsViewBody(
        post: post,
      ),
    );
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
                itemCount: post.postComments.length,
                itemBuilder: (context, index) {
                  final comment = post.postComments[index];
                  return CommentItem(commentModel: comment);
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
        const UserImageContainer(imagePath: Assets.imagesAvatar13),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: CustomTextField(
                controller: commentController, hint: 'write comment'),
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
