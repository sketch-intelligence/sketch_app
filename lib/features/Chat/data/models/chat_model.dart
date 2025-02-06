import 'package:sketch/features/Chat/data/models/message_model.dart';

class Chat {
  final String userName;
  final String lastMessage;
  final String time; // Time of the last message
  final bool isOnline; // Online status indicator
  final List<Message> messages; // List of messages

  Chat({
    required this.userName,
    required this.lastMessage,
    required this.time,
    required this.isOnline,
    required this.messages,
  });
}
