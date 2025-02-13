// import 'package:rent_chicken/core/responses/ApiResponse.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
//
// class SendMessageResponse extends ApiResponse<LastMessageModel> {
//   SendMessageResponse({
//     required super.message,
//     required super.success,
//     required super.data,
//     required super.status});
//
//   factory SendMessageResponse.fromJson(Map<String, dynamic> json) {
//     return SendMessageResponse(
//       success: json["success"],
//       message: json["message"],
//       status: json["status"],
//       data:  LastMessageModel.fromJson(json['data']),
//     );
//   }
// }
