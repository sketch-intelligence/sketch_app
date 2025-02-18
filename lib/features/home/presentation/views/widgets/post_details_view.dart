import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/constants.dart';
import 'package:sketch/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:sketch/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/ui/dialogs/dialogs.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';
import 'package:sketch/features/home/data/cubit/post_cubit.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/add_comment_use_case.dart';
import 'package:sketch/features/home/presentation/use_case/get_one_post_use_case.dart';
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

class PostDetailsViewBody extends StatefulWidget {
  const PostDetailsViewBody({super.key, required this.post});
  final PostModel post;
  static final TextEditingController commentController =
      TextEditingController();

  @override
  State<PostDetailsViewBody> createState() => _PostDetailsViewBodyState();
}

class _PostDetailsViewBodyState extends State<PostDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is UpdateState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post details
            PostListViewItem(postModel: widget.post),

            // List of comments

            Expanded(
              child: GetModel(
                useCaseCallBack: () {
                  return GetPostCommentsUseCase(
                          homeRepository: HomeRepository())
                      .call(
                          params: GetPostCommentsParams(
                              postId: widget.post.id ?? 0));
                },
                withAnimation: true,
                modelBuilder: (model) => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.post.comments?.length ?? 0,
                  itemBuilder: (context, index) {
                    final comment = widget.post.comments?[index];
                    return CommentItem(commentModel: comment!);
                  },
                ),
              ),
            ),

            // Fixed Footer for Adding Comments
            Container(
              width: double.infinity, // ✅ Prevent infinite width issue
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: AddComment(
                commentController: PostDetailsViewBody.commentController,
                postId: widget.post.id ?? 0,
              ),
            ),
          ],
        );
      },
    );
  }
}

class AddComment extends StatefulWidget {
  AddComment({
    super.key,
    required this.commentController,
    required this.postId,
  });

  final int postId;
  final TextEditingController commentController;

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final textKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 80, // ✅ Prevent infinite height issues
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey,
              backgroundImage: const NetworkImage(dummyProfileImage),
            ),

            // ✅ Expanded prevents infinite width
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomTextField(
                  controller: widget.commentController,
                  hint: AppLocalizations.of(context)!.writeComment,
                ),
              ),
            ),

            // Send Button inside a constrained box
            SizedBox(
              width: 48, // ✅ Fix infinite width issue
              child: CreateModel(
                onCubitCreated: (cubit) {
                  context.read<PostCubit>().commentsCubit = cubit;
                },
                withValidation: true,
                onError: (val) {
                  Dialogs.showErrorSnackBar(message: val, context: context);
                },
                onTap: () => widget.commentController.text.isNotEmpty,
                useCaseCallBack: (model) {
                  return AddCommentUseCase(homeRepository: HomeRepository())
                      .call(
                    params: AddCommentParams(
                      postId: widget.postId,
                      userId: CacheHelper.userID ?? 0,
                      text: widget.commentController.text,
                    ),
                  );
                },
                onSuccess: (model) {
                  GetOnePostsUseCase(HomeRepository())
                      .call(params: GetOnePostParams(postId: widget.postId));
                  context.read<PostCubit>().updateStates();
                  context.read<PostCubit>().commentsCubit?.getData;
                  setState(() {});
                },
                child: CustomButton(
                  text: '',
                  icon: Assets.imagesPaperPlaneRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
