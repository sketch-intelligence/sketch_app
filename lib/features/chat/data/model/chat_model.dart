class ChatModel {
  final String chatId;
  final String userId;
  final String userName;
  final String userProfilePic;
  final String lastMessage;
  final String timestamp;
  final bool isOnline;

  ChatModel({
    required this.chatId,
    required this.userId,
    required this.userName,
    required this.userProfilePic,
    required this.lastMessage,
    required this.timestamp,
    required this.isOnline,
  });

  factory ChatModel.fromFirestore(Map<String, dynamic> data, String chatId) {
    return ChatModel(
      chatId: chatId,
      userId: data['userId'] ?? '',
      userName: data['userName'] ?? 'Unknown',
      userProfilePic: data['userProfilePic'] ?? '',
      lastMessage: data['lastMessage'] ?? 'Tap to chat',
      timestamp: (data['lastMessageTime'] as String),
      isOnline: data['isOnline'] ?? false,
    );
  }
}
