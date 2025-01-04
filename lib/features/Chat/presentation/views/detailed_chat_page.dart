import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/Chat/data/models/chat_model.dart';
import 'package:sketch/features/Chat/data/models/message_model.dart';
import 'package:sketch/features/Chat/presentation/Widgets/detailed%20chat%20page/detailed_top_section.dart';
import 'package:sketch/features/Chat/presentation/Widgets/detailed%20chat%20page/message_input.dart';

// Chat Detail Page
class DetailedChatPage extends StatelessWidget {
  final Chat chat;

  DetailedChatPage({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: DetailedTopSection(chat: chat),
        actions: [
          // Phone icon for calling
          IconButton(
            icon: SvgPicture.asset(Assets.imagesPhone), // Replace with the correct asset path
            onPressed: () {
              // Handle phone call action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chat.messages.length,
              itemBuilder: (context, index) {
                final message = chat.messages[index];
                bool isMe = message.senderName == "You"; // Change logic as needed
                return _buildMessageTile(message, isMe,context);
              },
            ),
          ),
          buildMessageInput(),
        ],
      ),
    );
  }









  Widget _buildMessageTile(Message message, bool isMe,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // Profile image for the sender/receiver
          if (!isMe)
           SvgPicture.asset(Assets.imagesAvatar22),
          SizedBox(width: 8),
          // Message bubble
          Flexible(
            child: Container(
              padding: EdgeInsets.all(12),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75, // Limit max width
              ),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[200] : Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Message content
                  Text(
                    message.content,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  // Message timestamp
                  Text(
                    message.time,
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          // Profile image for the sender/receiver
          if (isMe)
           SvgPicture.asset(Assets.imagesAvatar13),
        ],
      ),
    );
  }
}



