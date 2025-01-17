import 'package:flutter/material.dart';
import 'package:sketch/features/Chat/presentation/Widgets/chat%20page/chat_listview.dart';
import 'package:sketch/features/Chat/presentation/views/chatpage.dart';

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
        // Primary Chats Tab
        ChatListView(dummyChats),
        // Chatbot Chats Tab
        ChatListView(dummyChatbots),
      ],
    );
  }
}
