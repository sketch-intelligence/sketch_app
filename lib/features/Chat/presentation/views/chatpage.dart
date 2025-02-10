import 'package:flutter/material.dart';
import 'package:sketch/features/Chat/data/models/chat_model.dart';
import 'package:sketch/features/Chat/data/models/message_model.dart';
import 'package:sketch/features/Chat/presentation/Widgets/chat%20page/chat_body.dart';
import 'package:sketch/translations.dart';

// Chat Page
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.chats,
        ),
        centerTitle: true,
      ),
      body: ChatBody(tabController: _tabController),
    ));
  }
}

List<Chat> dummyChats = [
  Chat(
    userName: "Sally Rooney",
    lastMessage: "OMG!! Yummy 😍",
    time: "11:00 AM",
    isOnline: true,
    messages: [
      Message(senderName: "You", content: "Hey, what’s up?", time: "10:59 AM"),
      Message(
          senderName: "Sally Rooney",
          content: "OMG!! Yummy 😍",
          time: "11:00 AM"),
    ],
  ),
  Chat(
    userName: "Kristin Watson",
    lastMessage: "Aci ullamco",
    time: "9:30 AM",
    isOnline: true,
    messages: [
      Message(senderName: "You", content: "How's everything?", time: "9:29 AM"),
      Message(
          senderName: "Kristin Watson",
          content: "Aci ullamco",
          time: "9:30 AM"),
    ],
  ),
];

List<Chat> dummyChatbots = [
  Chat(
    userName: "Chatbot 1",
    lastMessage: "Hello! How can I help you?",
    time: "Now",
    isOnline: true,
    messages: [
      Message(
          senderName: "Chatbot 1",
          content: "Hello! How can I help you?",
          time: "12:00 PM"),
    ],
  ),
  Chat(
    userName: "Chatbot 2",
    lastMessage: "I'm here to assist you!",
    time: "1 min ago",
    isOnline: true,
    messages: [
      Message(
          senderName: "Chatbot 2",
          content: "I'm here to assist you!",
          time: "12:01 PM"),
    ],
  ),
];
