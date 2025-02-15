import 'package:flutter/material.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/chat_bot/presentation/Widgets/chat%20page/Chat_Tabar_view.dart';
import 'package:sketch/features/chat_bot/presentation/Widgets/chat%20page/chat_tab_bar.dart';

class BodyColumn extends StatelessWidget {
  const BodyColumn({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchTextField(),
        const SizedBox(height: 16),
        ChatTabBar(tabController: _tabController),
        const SizedBox(height: 25),
        Expanded(
          child: ChatTabBarView(tabController: _tabController),
        ),
      ],
    );
  }
}
