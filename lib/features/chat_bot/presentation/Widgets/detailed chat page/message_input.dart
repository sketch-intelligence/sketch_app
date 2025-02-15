import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/features/chat_bot/data/chatbot_service.dart';
import 'package:sketch/features/chat_bot/data/models/chat_model.dart';
import 'package:sketch/features/chat_bot/data/models/message_model.dart';
import 'package:sketch/translations.dart';

class BuildMessageInput extends StatefulWidget {
  final Chat chat;
  final Function(Message) onMessageSent;

  const BuildMessageInput(
      {super.key, required this.chat, required this.onMessageSent});

  @override
  _BuildMessageInputState createState() => _BuildMessageInputState();
}

class _BuildMessageInputState extends State<BuildMessageInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  void _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    String userMessage = _controller.text.trim();
    String currentTime = TimeOfDay.now().format(context);

    // Add user message to UI
    Message message =
        Message(senderName: "You", content: userMessage, time: currentTime);
    widget.onMessageSent(message);
    _controller.clear();

    setState(() {
      _isLoading = true;
    });

    try {
      String botResponse = await ChatbotService.sendMessage(userMessage);
      Message botMessage = Message(
          senderName: widget.chat.userName,
          content: botResponse,
          time: currentTime);
      widget.onMessageSent(botMessage);
    } catch (e) {
      print("Error: $e");
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.imagesShareNetwork),
              const SizedBox(width: 8.0),
              SvgPicture.asset(Assets.imagesSmiley),
              const SizedBox(width: 8.0),
              SvgPicture.asset(Assets.imagesImage59)
            ],
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.message,
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
              icon: _isLoading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.send, color: Colors.white),
              onPressed: _isLoading ? null : _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
