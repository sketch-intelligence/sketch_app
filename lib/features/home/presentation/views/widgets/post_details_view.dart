import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sketch/features/home/presentation/data/models/comment_model.dart';
import 'package:sketch/features/home/presentation/data/models/person_model.dart';
import 'package:sketch/features/home/presentation/data/models/post_model.dart';
import 'package:sketch/features/home/presentation/data/models/reaction_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/comment_item.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';

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
  static final List<CommentModel> comments = [
    CommentModel(
      text: 'this is comment number 1',
      commentOwner: PersonModel(
        userName: 'a',
      ),
      reactions: [
        ReactionModel(
          reactedOwner: PersonModel(userName: 'a'),
          reactionType: 's',
        ),
      ],
      commentDate: DateFormat('HH').format(DateTime.now()),
    ),
    CommentModel(
      text: 'this is comment number 2',
      commentOwner: PersonModel(
        userName: 'a',
      ),
      reactions: [
        ReactionModel(
          reactedOwner: PersonModel(userName: 'a'),
          reactionType: 's',
        ),
      ],
      commentDate: DateFormat('HH').format(DateTime.now()),
    ),
    CommentModel(
      text: 'this is comment number 3',
      commentOwner: PersonModel(
        userName: 'a',
      ),
      reactions: [
        ReactionModel(
          reactedOwner: PersonModel(userName: 'a'),
          reactionType: 's',
        ),
      ],
      commentDate: DateFormat('HH').format(DateTime.now()),
    )
  ];

  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PostListViewItem(postModel: post)),
        SliverList.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return CommentItem(commentModel: comment);
            })
      ],
    );
  }
}
