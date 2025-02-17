import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_post_comments_use_case.dart';
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
        body: PostDetailsViewBody(post: post), // Keep only one Scaffold
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
      crossAxisAlignment: CrossAxisAlignment.start, // Align content properly
      children: [
        // Post details
        PostListViewItem(postModel: post),

        // Use Expanded to allow ListView to take available space
        Expanded(
          child: GetModel(
            useCaseCallBack: () {
              return GetPostCommentsUseCase(homeRepository: HomeRepository())
                  .call(params: GetPostCommentsParams(postId: post.id ?? 0));
            },
            withAnimation: true,
            modelBuilder: (model) => ListView.builder(
              shrinkWrap: true, // Prevents infinite height issue
              physics: const BouncingScrollPhysics(), // Smooth scrolling
              itemCount: post.comments?.length ?? 0,
              itemBuilder: (context, index) {
                final comment = post.comments?[index];
                return CommentItem(commentModel: comment!);
              },
            ),
          ),
        ),

        // Comment input section with width constraints
        Container(
          width: double.infinity, // Prevents infinite width issue
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.white, // Background color for visibility
          child: AddComment(
            commentController: commentController,
            postId: post.id ?? 0,
          ),
        ),
      ],
    );
  }
}

class AddComment extends StatelessWidget {
  AddComment({
    super.key,
    required this.commentController,
    required this.postId,
  });

  final int postId;
  final TextEditingController commentController;
  final textKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures Row has proper width constraints
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      color: Colors.white, // Background color for visibility
      child: Row(
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey,
            backgroundImage: const NetworkImage(dummyProfileImage),
          ),

          // Expanded ensures TextField does not take infinite width
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CustomTextField(
                key: textKey,
                controller: commentController,
                hint: AppLocalizations.of(context)!.writeComment,
              ),
            ),
          ),

          // Send Button
          CreateModel(
            withValidation: true,
            useCaseCallBack: (model) {
              return AddCommentUseCase(homeRepository: HomeRepository()).call(
                params: AddCommentParams(
                  postId: postId,
                  userId: CacheHelper.userID ?? 0,
                  text: commentController.text,
                ),
              );
            },
            onSuccess: (model) {
              GetPostCommentsUseCase(homeRepository: HomeRepository())
                  .call(params: GetPostCommentsParams(postId: postId));
            },
            child: CustomButton(
              text: '',
              icon: Assets.imagesPaperPlaneRight,
            ),
          ),
        ],
      ),
    );
  }
}
