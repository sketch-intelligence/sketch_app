import 'package:flutter/material.dart';
import 'package:sketch/core/boilerplate/pagination/widgets/pagination_list.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/home/presentation/use_case/get_posts_use_case.dart';
import 'package:sketch/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  // static final List<PostModel> posts = [
  //   PostModel(
  //     text: 'this is post number 1',
  //     postOwner: PersonModel(userName: 'a'),
  //     postComments: [
  //       CommentModel(
  //         text: 'comment for post 1',
  //         commentOwner: PersonModel(userName: 'a'),
  //         reactions: [
  //           ReactionModel(
  //             reactedOwner: PersonModel(userName: 'a'),
  //             reactionType: 's',
  //           )
  //         ],
  //         commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
  //       ),
  //       CommentModel(
  //         text: 'second comment for post 1',
  //         commentOwner: PersonModel(userName: 'a'),
  //         reactions: [
  //           ReactionModel(
  //             reactedOwner: PersonModel(userName: 'a'),
  //             reactionType: 's',
  //           )
  //         ],
  //         commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
  //       ),
  //       CommentModel(
  //         text: 'third comment for post 1',
  //         commentOwner: PersonModel(userName: 'a'),
  //         reactions: [
  //           ReactionModel(
  //             reactedOwner: PersonModel(userName: 'a'),
  //             reactionType: 's',
  //           )
  //         ],
  //         commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
  //       )
  //     ],
  //     reactions: [
  //       ReactionModel(
  //           reactedOwner: PersonModel(userName: 'a'), reactionType: 's')
  //     ],
  //     shares: [
  //       ShareModel(
  //         shareOwner: PersonModel(userName: 'a'),
  //       ),
  //     ],
  //     isPublic: true,
  //     postDate: DateTime.now().subtract(const Duration(hours: 10)),
  //   ),
  //   PostModel(
  //     text: 'this is post number 2',
  //     postOwner: PersonModel(userName: 'a'),
  //     postComments: [
  //       CommentModel(
  //         text: 'comment for post 2',
  //         commentOwner: PersonModel(userName: 'a'),
  //         reactions: [
  //           ReactionModel(
  //             reactedOwner: PersonModel(userName: 'a'),
  //             reactionType: 's',
  //           )
  //         ],
  //         commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
  //       ),
  //       CommentModel(
  //         text: 'second comment for post 2',
  //         commentOwner: PersonModel(userName: 'a'),
  //         reactions: [
  //           ReactionModel(
  //             reactedOwner: PersonModel(userName: 'a'),
  //             reactionType: 's',
  //           )
  //         ],
  //         commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
  //       ),
  //       CommentModel(
  //         text: 'third comment for post 2',
  //         commentOwner: PersonModel(userName: 'a'),
  //         reactions: [
  //           ReactionModel(
  //             reactedOwner: PersonModel(userName: 'a'),
  //             reactionType: 's',
  //           )
  //         ],
  //         commentDate: DateTime.now().subtract(const Duration(minutes: 10)),
  //       )
  //     ],
  //     reactions: [
  //       ReactionModel(
  //         reactedOwner: PersonModel(userName: 'a'),
  //         reactionType: 's',
  //       )
  //     ],
  //     shares: [
  //       ShareModel(
  //         shareOwner: PersonModel(userName: 'a'),
  //       ),
  //     ],
  //     isPublic: true,
  //     postDate: DateTime.now().subtract(const Duration(minutes: 10)),
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const CustomAppBar(),
          const Text(
            'Feed',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Expanded(
            // Take remaining space
            child: PaginationList<PostModel>(
              withPagination: true,
              repositoryCallBack: (model) =>
                  GetAllPostsUseCase(HomeRepository())
                      .call(params: GetPostsParams(request: model)),
              listBuilder: (list) => ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return PostListViewItem(postModel: list[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
