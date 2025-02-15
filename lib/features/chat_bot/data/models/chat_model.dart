import 'package:sketch/features/Chat/data/models/message_model.dart';

class Chat {
  final String userName;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final List<Message> messages;

  Chat({
    required this.userName,
    required this.lastMessage,
    required this.time,
    required this.isOnline,
    required this.messages,
  });
}
