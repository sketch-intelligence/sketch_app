import 'package:flutter/material.dart';
import 'package:sketch/translations.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      AppLocalizations.of(context)!.postsContent,
    ));
  }
}
