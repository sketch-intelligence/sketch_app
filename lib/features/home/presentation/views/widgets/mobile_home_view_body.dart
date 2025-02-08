import 'package:flutter/material.dart';
import 'package:sketch/core/utils/app_styles.dart';
import 'package:sketch/features/Profile/data/models/profile_user_model.dart';
import 'package:sketch/features/home/data/models/comment_model.dart';
import 'package:sketch/features/home/data/models/person_model.dart';
import 'package:sketch/features/home/data/models/post_model.dart';
import 'package:sketch/features/home/data/models/reaction_model.dart';
import 'package:sketch/features/home/data/models/share_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';
import 'package:sketch/translations.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  static final List<PostModel> posts = [
    PostModel(
      text: 'this is post number 1',
      postOwner: ProfileModel(
          person: PersonModel(userName: "omar"), bio: "hello World"),
      postComments: [
        CommentModel(
          text: 'comment for post 1',
          commentOwner: PersonModel(userName: 'a'),
          reactions: [
            ReactionModel(
              reactedOwner: PersonModel(userName: 'a'),
              reactionType: 's',
            )
          ],
          commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        CommentModel(
          text: 'second comment for post 1',
          commentOwner: PersonModel(userName: 'a'),
          reactions: [
            ReactionModel(
              reactedOwner: PersonModel(userName: 'a'),
              reactionType: 's',
            )
          ],
          commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        CommentModel(
          text: 'third comment for post 1',
          commentOwner: PersonModel(userName: 'a'),
          reactions: [
            ReactionModel(
              reactedOwner: PersonModel(userName: 'a'),
              reactionType: 's',
            )
          ],
          commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
        )
      ],
      reactions: [
        ReactionModel(
            reactedOwner: PersonModel(userName: 'a'), reactionType: 's')
      ],
      shares: [
        ShareModel(
          shareOwner: PersonModel(userName: 'a'),
        ),
      ],
      isPublic: true,
      postDate: DateTime.now().subtract(const Duration(hours: 10)),
    ),
    PostModel(
      text: 'this is post number 2',
      postOwner:
          ProfileModel(person: PersonModel(userName: "beshir"), bio: "coding"),
      postComments: [
        CommentModel(
          text: 'comment for post 2',
          commentOwner: PersonModel(userName: 'a'),
          reactions: [
            ReactionModel(
              reactedOwner: PersonModel(userName: 'a'),
              reactionType: 's',
            )
          ],
          commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        CommentModel(
          text: 'second comment for post 2',
          commentOwner: PersonModel(userName: 'a'),
          reactions: [
            ReactionModel(
              reactedOwner: PersonModel(userName: 'a'),
              reactionType: 's',
            )
          ],
          commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        CommentModel(
          text: 'third comment for post 2',
          commentOwner: PersonModel(userName: 'a'),
          reactions: [
            ReactionModel(
              reactedOwner: PersonModel(userName: 'a'),
              reactionType: 's',
            )
          ],
          commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
        )
      ],
      reactions: [
        ReactionModel(
          reactedOwner: PersonModel(userName: 'a'),
          reactionType: 's',
        )
      ],
      shares: [
        ShareModel(
          shareOwner: PersonModel(userName: 'a'),
        ),
      ],
      isPublic: true,
      postDate: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomAppBar(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppLocalizations.of(context)!.feed,
              style: AppStyles.styleSemiBold20(context),
            ),
          ),
          SliverList.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostListViewItem(postModel: post);
              })
        ],
      ),
    );
  }
}
