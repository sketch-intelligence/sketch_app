import 'package:flutter/material.dart';
import 'package:sketch/features/chat/data/model/chat_model.dart';
import 'package:sketch/features/chat/service/real_chat_service.dart';
import 'package:sketch/features/chat_bot/presentation/Widgets/chat%20page/chat_listview.dart';

class ChatTabBarView extends StatefulWidget {
  const ChatTabBarView({super.key, required this.tabController});
  final TabController tabController;

  @override
  _ChatTabBarViewState createState() => _ChatTabBarViewState();
}

class _ChatTabBarViewState extends State<ChatTabBarView> {
  late Future<List<ChatModel>> _chatsFuture;

  @override
  void initState() {
    super.initState();
    _chatsFuture = ChatService().getUserChats();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatModel>>(
      future: _chatsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        List<ChatModel> chats = snapshot.data ?? [];
        return ChatListView(chats);
      },
    );
  }
}
