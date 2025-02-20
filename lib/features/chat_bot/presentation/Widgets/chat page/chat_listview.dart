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
            backgroundImage: chat.userProfilePic.isNotEmpty
                ? NetworkImage(chat.userProfilePic)
                : null, // Use null if no profile picture
            child: chat.userProfilePic.isEmpty
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          title: Text(
            chat.userName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            chat.lastMessage,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                chat.timestamp,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
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
