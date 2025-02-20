import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sketch/core/functions/format_time.dart';
import 'package:sketch/features/chat/data/model/chat_model.dart';
import 'package:sketch/features/chat/data/model/message_model.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String senderId, String receiverId, String? chatId,
      MessageModel message) async {
    if (chatId == null) {
      // Generate chat ID by checking if a chat already exists
      chatId = await _getOrCreateChat(senderId, receiverId);
    }

    DocumentReference chatRef = _firestore.collection('chats').doc(chatId);

    // ✅ Convert message to a map before adding to Firestore
    await chatRef.collection('messages').add(message.toMap());

    // ✅ Increase unread messages count for the receiver
    await chatRef.update({
      'unreadMessages.$receiverId': FieldValue.increment(1),
    });
    await chatRef.update({
      'lastMessage': message.text,
      'lastMessageTime': FieldValue.serverTimestamp(),
    });
  }

  Future<void> markMessagesAsRead(String userId) async {
    QuerySnapshot chatSnapshot = await _firestore
        .collection('chats')
        .where('participants', arrayContains: userId)
        .get();

    for (var doc in chatSnapshot.docs) {
      await doc.reference.update({
        'unreadMessages.$userId': 0, // Reset unread count
      });
    }
  }

  Stream<num> getUnreadMessagesCount(String userId) {
    return _firestore
        .collection('chats')
        .where('participants', arrayContains: userId)
        .snapshots()
        .map((snapshot) {
      num totalUnread = 0;
      for (var doc in snapshot.docs) {
        Map<String, dynamic>? unreadMessages = doc['unreadMessages'];
        if (unreadMessages != null && unreadMessages.containsKey(userId)) {
          totalUnread += unreadMessages[userId];
        }
      }
      return totalUnread;
    });
  }

  Future<String> createChat(String senderId, String receiverId) async {
    final chatQuery = await _firestore
        .collection('chats')
        .where('participants', arrayContains: senderId)
        .get();

    for (var doc in chatQuery.docs) {
      List participants = doc.data()['participants'];
      if (participants.contains(receiverId)) {
        return doc.id; // Return existing chat ID
      }
    }

    // If chat does not exist, create a new one
    final newChatRef = _firestore.collection('chats').doc();
    await newChatRef.set({
      'participants': [senderId, receiverId],
      'createdAt': FieldValue.serverTimestamp(),
    });

    return newChatRef.id;
  }

  Stream<List<MessageModel>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MessageModel.fromMap(doc.data()))
            .toList());
  }

  Stream<int> getUnreadMessageCount(String userId) {
    return FirebaseFirestore.instance
        .collection('chats')
        .where('participants', arrayContains: userId)
        .snapshots()
        .asyncMap((querySnapshot) async {
      int totalUnread = 0;

      for (var chat in querySnapshot.docs) {
        var messagesQuery = await chat.reference
            .collection('messages')
            .where('receiverId', isEqualTo: userId)
            .where('isRead', isEqualTo: false)
            .get();

        totalUnread += messagesQuery.docs.length;
      }
      return totalUnread;
    });
  }

  Future<String> getOrCreateChat(String senderId, String receiverId) async {
    // Check if a chat already exists
    QuerySnapshot query = await _firestore
        .collection('chats')
        .where('participants', arrayContains: senderId)
        .get();

    for (var doc in query.docs) {
      List participants = doc['participants'];
      if (participants.contains(receiverId)) {
        return doc.id; // ✅ Chat exists, return ID
      }
    }

    // Create a new chat if none exists
    DocumentReference chatRef = await _firestore.collection('chats').add({
      'participants': [senderId, receiverId], // ✅ Ensure both IDs are stored
      'createdAt': FieldValue.serverTimestamp(),
    });

    return chatRef.id;
  }

  Future<String?> _getFirebaseUidFromMysqlId(String mysqlId) async {
    QuerySnapshot query = await _firestore
        .collection('users')
        .where('mysqlId',
            isEqualTo: mysqlId) // 🔹 Your Firestore must store MySQL ID
        .limit(1)
        .get();

    if (query.docs.isNotEmpty) {
      return query.docs.first.id; // 🔹 Firebase UID is the document ID
    }
    return null;
  }

  Future<String> _getOrCreateChat(String senderId, String receiverId) async {
    QuerySnapshot chatQuery = await _firestore
        .collection('chats')
        .where('participants', arrayContains: senderId)
        .get();

    for (var doc in chatQuery.docs) {
      List<dynamic> participants = doc['participants'];
      if (participants.contains(receiverId)) {
        return doc.id; // Return existing chat ID
      }
    }

    // If no chat exists, create a new one
    DocumentReference newChatRef = await _firestore.collection('chats').add({
      'participants': [senderId, receiverId],
      'createdAt': FieldValue.serverTimestamp(),
    });

    return newChatRef.id;
  }

  // Future<List<ChatModel>> getUserChats() async {
  //   String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  //   // 🔹 Fetch all chat documents where the user is a participant
  //   QuerySnapshot chatSnapshot = await _firestore
  //       .collection('chats')
  //       .where('participants', arrayContains: currentUserId)
  //       .orderBy('createdAt', descending: true)
  //       .get();

  //   List<ChatModel> chats = [];

  //   for (var doc in chatSnapshot.docs) {
  //     List participants = doc['participants'];

  //     // 🔹 Get the other participant's ID
  //     String receiverId = participants.firstWhere((id) => id != currentUserId,
  //         orElse: () => '');

  //     if (receiverId.isEmpty) continue; // Skip if invalid

  //     // 🔹 Fetch receiver details from Firestore
  //     DocumentSnapshot userDoc =
  //         await _firestore.collection('users').doc(receiverId).get();

  //     if (!userDoc.exists) continue; // Skip if user doesn't exist

  //     // 🔹 Create Chat object
  //     ChatModel chat = ChatModel(
  //       chatId: doc.id,
  //       userId: receiverId,
  //       userName: userDoc['name'],
  //       userProfilePic: userDoc['profilePic'],
  //       lastMessage: "Tap to chat",
  //       time: "Now",
  //       isOnline: false,
  //     );

  //     chats.add(chat);
  //   }

  //   return chats;
  // }
  Future<List<ChatModel>> getUserChats() async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    try {
      QuerySnapshot chatSnapshot = await _firestore
          .collection('chats')
          .where('participants', arrayContains: currentUserId)
          .orderBy('lastMessageTime', descending: true)
          .get();

      if (chatSnapshot.docs.isEmpty) {
        print("No chats found for user: $currentUserId");
      } else {
        print("Chats found: ${chatSnapshot.docs.length}");
        for (var doc in chatSnapshot.docs) {
          print("Chat ID: ${doc.id}, Data: ${doc.data()}");
        }
      }

      List<ChatModel> chats = [];

      for (var doc in chatSnapshot.docs) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

        if (data == null) continue;

        List participants = data['participants'] ?? [];

        String? receiverId = participants
            .firstWhere((id) => id != currentUserId, orElse: () => null);

        if (receiverId == null) continue;

        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(receiverId).get();

        if (!userDoc.exists) continue;

        String lastMessage = data['lastMessage'] ?? "Tap to chat";
        Timestamp? lastMessageTimestamp = data['lastMessageTime'] as Timestamp?;
        String formattedTime = lastMessageTimestamp != null
            ? formatTimestamp(lastMessageTimestamp)
            : "Now";

        ChatModel chat = ChatModel(
          chatId: doc.id,
          userId: receiverId,
          userName: userDoc['name'],
          userProfilePic: userDoc['profilePic'],
          lastMessage: lastMessage,
          timestamp: formattedTime,
          isOnline: false,
        );

        chats.add(chat);
      }

      print("Final chat list count: ${chats.length}");
      return chats;
    } catch (e) {
      print("Error fetching user chats: $e");
      return [];
    }
  }
}
