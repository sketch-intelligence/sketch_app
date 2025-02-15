import 'package:flutter/material.dart';
import 'package:sketch/features/chat_bot/presentation/Widgets/chat%20page/chat_listview.dart';
import 'package:sketch/features/chat_bot/presentation/views/chatpage.dart';

class ChatTabBarView extends StatelessWidget {
  const ChatTabBarView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        ChatListView(dummyChats),
        ChatListView(dummyChatbots),
      ],
    );
  }
}
