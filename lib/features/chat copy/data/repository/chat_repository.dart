// import 'package:rent_chicken/core/constant/end_points/api_url.dart';
// import 'package:rent_chicken/core/data_source/remote_data_source.dart';
// import 'package:rent_chicken/core/http/http_method.dart';
// import 'package:rent_chicken/core/repository/core_repository.dart';
// import 'package:rent_chicken/core/results/result.dart';
// import 'package:rent_chicken/features/auth/data/model/login_model.dart';
// import 'package:rent_chicken/features/chat/data/model/conversation_model.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/use_case/all_converstions_usae_case.dart';
// import 'package:rent_chicken/features/chat/data/use_case/get_conversation_attachment.dart';
// import 'package:rent_chicken/features/chat/data/use_case/get_messages_con_use_case.dart';
// import 'package:rent_chicken/features/chat/data/use_case/send_message_use_caes.dart';

// import '../use_case/delete_conversation_usecase.dart';
// import '../use_case/get_support_id.dart';
// import '../use_case/get_support_usecase.dart';

// class ChatRepository extends CoreRepository {
//   Future<Result<List<ConversationModel>>> getAllConversations(
//       {required GetConversationsParams params}) async {
//     final result = await RemoteDataSource.request<ConversationListModel>(
//         withAuthentication: true,
//         url: getAllConversationsLink,
//         method: HttpMethod.GET,
//         queryParameters: params.toJson(),
//         responseStr: 'ConversationResponse',
//         converter: (json) => ConversationListModel.fromJson(json['data']));
//     return paginatedCall(result: result);
//   }

//   Future<Result<List<LastMessageModel>>> getAllMessagesByConversation(
//       {required GetMessagesParams params}) async {
//     final result = await RemoteDataSource.request(
//         withAuthentication: true,
//         url: '$getMessagesLink\\${params.conversationId}',
//         method: HttpMethod.GET,
//         queryParameters: params.request.toJson(),
//         responseStr: 'GetMessagesResponse',
//         converter: (json) => MessageLastListModel.fromJson(json));
//     return paginatedCall(result: result);
//   }

//   Future<Result<LastMessageModel>> sendMessage(
//       {required ChatParams params}) async {
//     final result = await RemoteDataSource.request(
//         fileVideoKey: 'videos[]',
//         videoFiles: params.videos,
//         fileKey: 'photos[]',
//         files: params.photos,
//         withAuthentication: true,
//         url: sendMsgLink,
//         method: HttpMethod.POST,
//         data: params.toJson(),
//         responseStr: 'SendMessageResponse',
//         converter: (json) => LastMessageModel.fromJson(json['data']));
//     return call(result: result);
//   }

//   Future<Result<LastMessageModel>> getConversationByOne(
//       {required GetConversationByOneParams params}) async {
//     final result = await RemoteDataSource.request(
//         withAuthentication: true,
//         url: '$getMessageAttachmentLink\\${params.msgId}',
//         method: HttpMethod.GET,
//         responseStr: 'ConversationByOneResponse',
//         converter: (json) => LastMessageModel.fromJson(json['data']));
//     return call(result: result);
//   }

//   Future<Result<String>> deleteConversation(
//       {required DeleteConversationParams params}) async {
//     final result = await RemoteDataSource.noModelRequest(
//       withAuthentication: true,
//       url: '$deleteMsgLink\\${params.conversationId}',
//       method: HttpMethod.DELETE,
//     );
//     return noModelCall(result: result);
//   }

//   Future<Result<ConversationModel>> getSupportMessage(
//       {required GetSupportMsgParams params}) async {
//     final result = await RemoteDataSource.request(
//         withAuthentication: true,
//         url: supportMsgLink,
//         method: HttpMethod.GET,
//         responseStr: 'GetSupportMessage',
//         converter: (json) => ConversationModel.fromJson(json['data']));
//     return call(result: result);
//   }

//   Future<Result<LoginModel>> getSupportId(
//       {required GetSupportIdParams params}) async {
//     final result = await RemoteDataSource.request(
//         withAuthentication: true,
//         url: usersUrl,
//         method: HttpMethod.GET,
//         queryParameters: {"role_id": 31},
//         responseStr: 'GetSupportIDResponse',
//         converter: (json) => LoginModel.fromJson(json['data']));
//     return call(result: result);
//   }
// }
