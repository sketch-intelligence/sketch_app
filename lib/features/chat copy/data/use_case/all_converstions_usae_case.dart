// import 'package:rent_chicken/core/params/base_params.dart';
// import 'package:rent_chicken/core/results/result.dart';
// import 'package:rent_chicken/core/usecase/usecase.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';

// import '../../../../core/boilerplate/pagination/models/get_list_request.dart';
// import '../model/conversation_model.dart';

// class GetConversationsParams extends BaseParams {
//   final GetListRequest? request;
//   final String? keywords;

//   GetConversationsParams({required this.request, required this.keywords});

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (request != null) data.addAll(request!.toJson());
//     if (keywords != '') data.putIfAbsent('keywords', () => keywords);
//     return data;
//   }
// }

// class GetAllConversationsUseCase
//     extends UseCase<List<ConversationModel>, GetConversationsParams> {
//   final ChatRepository repository;
//   GetAllConversationsUseCase(this.repository);

//   @override
//   Future<Result<List<ConversationModel>>> call(
//       {required GetConversationsParams params}) {
//     return repository.getAllConversations(params: params);
//   }
// }
