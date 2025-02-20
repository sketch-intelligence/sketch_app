// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sketch/features/chat/data/model/message_model.dart';
import 'package:sketch/features/chat/service/real_chat_service.dart';

class ChatChat {
  final String chatId;
  final String receiverId;
  ChatChat({
    required this.chatId,
    required this.receiverId,
  });
}

class ChatScreen extends StatefulWidget {
  ChatChat chat;

  ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendMessage() async {
    if (_messageController.text.isEmpty) return;

    final user = _auth.currentUser;
    if (user == null) return;

    String chatId = widget.chat.chatId;
    if (chatId == 'chatId') {
      chatId = await _chatService.createChat(user.uid, widget.chat.receiverId);
      setState(() {
        widget.chat =
            ChatChat(chatId: chatId, receiverId: widget.chat.receiverId);
      });
    }

    final message = MessageModel(
      senderId: user.uid,
      receiverId: widget.chat.receiverId,
      text: _messageController.text,
      timestamp: DateTime.now(),
    );

    _chatService.sendMessage(user.uid, widget.chat.receiverId, chatId, message);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: _chatService.getMessages(widget.chat.chatId),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                var messages = snapshot.data!;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message.senderId == _auth.currentUser!.uid;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(message.text,
                            style: TextStyle(
                                color: isMe ? Colors.white : Colors.black)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: "Type a message"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
