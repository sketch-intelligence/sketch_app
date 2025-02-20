class ChatModel {
  final String chatId;
  final String userId;
  final String userName;
  final String userProfilePic;
  final String lastMessage;
  final String time;
  final bool isOnline;

  ChatModel({
    required this.chatId,
    required this.userId,
    required this.userName,
    required this.userProfilePic,
    required this.lastMessage,
    required this.time,
    required this.isOnline,
  });
}
