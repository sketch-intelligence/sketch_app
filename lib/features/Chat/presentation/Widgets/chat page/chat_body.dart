import 'package:flutter/material.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/Chat/presentation/Widgets/chat%20page/Chat_Tabar_view.dart';
import 'package:sketch/features/Chat/presentation/Widgets/chat%20page/chat_tab_bar.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Body(tabController: _tabController),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       SearchTextField(),
        SizedBox(height: 16),
        ChatTabBar(tabController: _tabController),
        SizedBox(height: 25),
        Expanded(
          child: ChatTabBarView(tabController: _tabController),
        ),
      ],
    );
  }
}



