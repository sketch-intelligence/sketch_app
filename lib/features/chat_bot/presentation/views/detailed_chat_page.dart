import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/chat_bot/data/chatbot_service.dart';
import 'package:sketch/features/chat_bot/data/models/chat_model.dart';
import 'package:sketch/features/chat_bot/data/models/message_model.dart';

class DetailedChatPage extends StatefulWidget {
  final Chat chat;

  const DetailedChatPage({super.key, required this.chat});

  @override
  _DetailedChatPageState createState() => _DetailedChatPageState();
}

class _DetailedChatPageState extends State<DetailedChatPage> {
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages = widget.chat.messages;
  }

  void _addMessage(Message message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(widget.chat.userName),
          actions: [
            IconButton(
              icon: SvgPicture.asset(Assets.imagesDotsThreeVertical),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  bool isMe = message.senderName == "You";
                  return _buildMessageTile(message, isMe, context);
                },
              ),
            ),
            BuildMessageInput(
                chat: widget.chat, onMessageSent: _handleMessageSent),
          ],
        ),
      ),
    );
  }

  void _handleMessageSent(String text) async {
    final timestamp = DateFormat('hh:mm a').format(DateTime.now());
    final userMessage =
        Message(senderName: "You", content: text, time: timestamp);
    _addMessage(userMessage);

    try {
      final botResponse = await ChatbotService.sendMessage(text);
      final botMessage = Message(
          senderName: widget.chat.userName,
          content: botResponse,
          time: DateFormat('hh:mm a').format(DateTime.now()));
      _addMessage(botMessage);
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  Widget _buildMessageTile(Message message, bool isMe, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) SvgPicture.asset(Assets.imagesArtificialBrain),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[200] : Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message.time,
                    style: const TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isMe) SvgPicture.asset(Assets.imagesAvatar13),
        ],
      ),
    );
  }
}

class BuildMessageInput extends StatefulWidget {
  final Chat chat;
  final Function(String) onMessageSent;

  const BuildMessageInput(
      {super.key, required this.chat, required this.onMessageSent});

  @override
  _BuildMessageInputState createState() => _BuildMessageInputState();
}

class _BuildMessageInputState extends State<BuildMessageInput> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    widget.onMessageSent(_controller.text.trim());
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
