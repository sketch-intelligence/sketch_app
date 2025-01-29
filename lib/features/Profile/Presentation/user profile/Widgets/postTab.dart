import 'package:flutter/material.dart';
import 'package:sketch/features/home/data/models/post_model.dart';
import 'package:sketch/features/home/presentation/views/widgets/post_list_view_item.dart';

class PostsTab extends StatelessWidget {
  final List<PostModel> posts;

  const PostsTab({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? const Center(
            child: Text(
              "No Posts Yet",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: PostListViewItem(postModel: post),
              );
            },
          );
  }
}
