// class SocketMessageModel {
//   Message? message;
//   int? conversationId;

//   SocketMessageModel({
//     this.message,
//     this.conversationId,
//   });

//   factory SocketMessageModel.fromJson(Map<String, dynamic> json) =>
//       SocketMessageModel(
//         message:
//             json["message"] == null ? null : Message.fromJson(json["message"]),
//         conversationId: json["conversation_id"],
//       );
// }

// class Message {
//   String? message;
//   int? conversationId;
//   bool? attachment;
//   int? receiver;
//   int? sender;
//   int? messageId;
//   DateTime? createdAt;

//   Message(
//       {this.message,
//       this.conversationId,
//       this.attachment,
//       this.receiver,
//       this.sender,
//       this.messageId,
//       this.createdAt});

//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         message: json["message"],
//         conversationId: json["conversation_id"],
//         attachment: json["attachment"],
//         receiver: json["receiver"],
//         sender: json["sender"],
//         messageId: json["message_id"],
//         createdAt: json["created_at"],
//       );
// }
