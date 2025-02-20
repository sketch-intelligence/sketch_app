import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sketch/core/utils/app_router.dart';
import 'package:sketch/features/chat/data/model/chat_model.dart';
import 'package:sketch/features/chat/presentation/chat_screen.dart';

class ChatListView extends StatelessWidget {
  final List<ChatModel> chats;

  const ChatListView(this.chats, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
              // backgroundImage: NetworkImage(chat.userProfilePic),
              ),
          title: Text(chat.userName),
          subtitle: Text(chat.lastMessage),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chat.time),
            ],
          ),
          onTap: () {
            // 🔹 Navigate to chat screen with chat ID and receiver ID
            GoRouter.of(context).push(AppRouter.kChatScreen,
                extra: ChatChat(chatId: chat.chatId, receiverId: chat.userId));
          },
        );
      },
    );
  }
}
