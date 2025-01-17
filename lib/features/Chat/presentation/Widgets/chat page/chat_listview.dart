import 'package:flutter/material.dart';
import 'package:sketch/features/Chat/data/models/chat_model.dart';
import 'package:sketch/features/Chat/presentation/views/detailed_chat_page.dart';

class ChatListView extends StatelessWidget {
  final List<Chat> chats;

  const ChatListView(this.chats, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: chat.isOnline ? Colors.green : Colors.grey,
            child: Text(chat.userName[0]),
          ),
          title: Text(chat.userName),
          subtitle: Text(chat.lastMessage),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (chat.isOnline)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              Text(chat.time),
            ],
          ),
          onTap: () {
            // Navigate to Chat Detail Page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedChatPage(chat: chat),
              ),
            );
          },
        );
      },
    );
  }
}
