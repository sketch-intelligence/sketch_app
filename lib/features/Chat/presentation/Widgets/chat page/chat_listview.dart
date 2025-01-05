import 'package:flutter/material.dart';
import 'package:sketch/features/Chat/data/models/chat_model.dart';
import 'package:sketch/features/Chat/presentation/views/detailed_chat_page.dart';

class ChatListView extends StatelessWidget {
  final List<Chat> chats;

  ChatListView(this.chats);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(chat.userName[0]),
            backgroundColor: chat.isOnline ? Colors.green : Colors.grey,
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
                  decoration: BoxDecoration(
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