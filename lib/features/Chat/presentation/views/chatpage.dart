import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/core/constant/app_images_icons/app_assets.dart';
import 'package:sketch/core/widgets/custom_search_text_field.dart';
import 'package:sketch/features/Chat/data/models/chat_model.dart';
import 'package:sketch/features/Chat/data/models/message_model.dart';
import 'package:sketch/features/Chat/presentation/Widgets/chat%20page/Chat_Tabar_view.dart';
import 'package:sketch/features/Chat/presentation/Widgets/chat%20page/chat_body.dart';
import 'package:sketch/features/Chat/presentation/Widgets/chat%20page/chat_tab_bar.dart';
import 'package:sketch/features/Chat/presentation/views/detailed_chat_page.dart';




// Chat Page
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text('Chats'),
        centerTitle: true,
      ),
      body: ChatBody(tabController: _tabController),
    );
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
      Message(senderName: "Sally Rooney", content: "OMG!! Yummy 😍", time: "11:00 AM"),
    ],
  ),
  Chat(
    userName: "Kristin Watson",
    lastMessage: "Aci ullamco",
    time: "9:30 AM",
    isOnline: true,
    messages: [
      Message(senderName: "You", content: "How's everything?", time: "9:29 AM"),
      Message(senderName: "Kristin Watson", content: "Aci ullamco", time: "9:30 AM"),
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
      Message(senderName: "Chatbot 1", content: "Hello! How can I help you?", time: "12:00 PM"),
    ],
  ),
  Chat(
    userName: "Chatbot 2",
    lastMessage: "I'm here to assist you!",
    time: "1 min ago",
    isOnline: true,
    messages: [
      Message(senderName: "Chatbot 2", content: "I'm here to assist you!", time: "12:01 PM"),
    ],
  ),
];