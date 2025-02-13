// import 'package:rent_chicken/core/data_source/model.dart';
// import 'package:rent_chicken/core/responses/ApiResponse.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
//
// import 'conversation_model.dart';
//
// class GetSupportMessage extends ApiResponse<ConversationModel> {
//   GetSupportMessage({
//     required super.message,
//     required super.success,
//     required super.data,
//     required super.status});
//
//   factory GetSupportMessage.fromJson(Map<String, dynamic> json) {
//     return GetSupportMessage(
//       success: json["success"],
//       message: json["message"],
//       status: json["status"],
//       data:  ConversationModel.fromJson(json['data']),
//     );
//   }
// }
