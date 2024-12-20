import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/home/presentation/data/models/post_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_body.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_header.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_reactions.dart';

class PostListViewItem extends StatelessWidget {
  const PostListViewItem({super.key, required this.postModel});
  final PostModel postModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kPostDetailsView, extra: postModel);
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              PostHeader(postModel: postModel),
              PostBody(postModel: postModel),
              PostReactions(postModel: postModel)
            ],
          ),
        ),
      ),
    );
  }
}
