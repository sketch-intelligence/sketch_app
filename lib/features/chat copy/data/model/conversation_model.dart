// import 'package:rent_chicken/core/data_source/model.dart';
// import 'package:rent_chicken/features/auth/data/model/login_model.dart';

// import 'last_message_model.dart';

// class ConversationListModel extends BaseModel {
//   List<ConversationModel>? data;

//   ConversationListModel({this.data});

//   ConversationListModel.fromJson(List<dynamic> json) {
//     data = <ConversationModel>[];
//     for (var v in json) {
//       data!.add(ConversationModel.fromJson(v as Map<String, dynamic>));
//     }
//   }
// }

// class ConversationModel extends BaseModel {
//   int? id;
//   int? firstUser; //if(firstUser==auth)?show second:show first
//   int? secondUser;
//   int? startedBy;
//   LoginModel? userSender;
//   LoginModel? userReceiver;
//   String? firstPhoto;
//   String? firstUsername;
//   String? firstName;
//   String? secondPhoto;
//   String? secondUsername;
//   String? secondName;
//   LastMessageModel? lastMessageModel;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   bool isBlocked;
//   ConversationModel(
//       {this.id,
//       this.firstUser,
//       this.secondUser,
//       this.startedBy,
//       this.secondName,
//       this.secondPhoto,
//       this.secondUsername,
//       this.firstName,
//       this.firstPhoto,
//       this.firstUsername,
//       this.lastMessageModel,
//       this.createdAt,
//       this.updatedAt,
//       this.isBlocked = false});

//   factory ConversationModel.fromJson(Map<String, dynamic> json) =>
//       ConversationModel(
//         id: json["id"],
//         firstUser: json["first_user"],
//         secondUser: json["second_user"],
//         startedBy: json["started_by"],
//         secondName: json['second_name'],
//         secondPhoto: json['second_photo'],
//         secondUsername: json['second_username'],
//         firstName: json['first_name'],
//         firstPhoto: json['first_photo'],
//         firstUsername: json['first_username'],
//         lastMessageModel: json["lastMessage"] == null
//             ? null
//             : LastMessageModel.fromJson(json["lastMessage"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         isBlocked: json['is_blocked'] == 1 ? true : false,
//       );
// }
