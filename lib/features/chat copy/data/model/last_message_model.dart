// import 'package:rent_chicken/features/auth/data/model/login_model.dart';
// import 'package:rent_chicken/features/chat/data/model/photo_model.dart';

// import '../../../../core/data_source/model.dart';
// import 'assets_media_list_model.dart';

// class MessageLastListModel extends BaseModel {
//   List<LastMessageModel>? data;
//   MessageLastListModel({this.data});
//   factory MessageLastListModel.fromJson(Map<String, dynamic> json) =>
//       MessageLastListModel(
//           data: json["data"] == null
//               ? null
//               : List<LastMessageModel>.from(
//                   json["data"]!.map((x) => LastMessageModel.fromJson(x))));
// }

// class LastMessageModel extends BaseModel {
//   int? id;
//   int? conversationId;
//   int? sender;
//   int? receiver;
//   String? message;
//   int? isRead;
//   DateTime? createdAt;
//   dynamic createdBy;
//   DateTime? updatedAt;
//   dynamic updatedBy;
//   dynamic deletedAt;
//   dynamic deletedBy;
//   String? senderName;
//   String? senderUsername;
//   LoginModel? userSender;
//   List<PhotoModel>? photos;
//   List<PhotoModel>? videos;
//   List<AssetsMediaListModel>? mediaList;
//   int? idLocal;

//   LastMessageModel(
//       {this.id,
//       this.conversationId,
//       this.sender,
//       this.receiver,
//       this.message,
//       this.isRead,
//       this.createdAt,
//       this.createdBy,
//       this.updatedAt,
//       this.updatedBy,
//       this.deletedAt,
//       this.deletedBy,
//       this.senderName,
//       this.senderUsername,
//       this.userSender,
//       this.photos,
//       this.videos,
//       this.mediaList,
//       this.idLocal});

//   factory LastMessageModel.fromJson(Map<String, dynamic> json) =>
//       LastMessageModel(
//         id: json["id"],
//         conversationId: json["conversation_id"],
//         sender: json["sender"],
//         receiver: json["receiver"],
//         message: json["message"],
//         isRead: json["is_read"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         createdBy: json["created_by"],
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         updatedBy: json["updated_by"],
//         deletedAt: json["deleted_at"],
//         deletedBy: json["deleted_by"],
//         senderName: json["sender_name"],
//         senderUsername: json["sender_username"],
//         photos: json["photos"] == null
//             ? []
//             : List<PhotoModel>.from(
//                 json["photos"]!.map((x) => PhotoModel.fromJson(x))),
//         videos: json["videos"] == null
//             ? []
//             : List<PhotoModel>.from(
//                 json["videos"]!.map((x) => PhotoModel.fromJson(x))),
//         // userSender: json["user_sender"] == null ? null : User.fromJson(json["user_sender"]),
//       );
// }
