// import 'package:rent_chicken/core/boilerplate/pagination/models/get_list_request.dart';
// import 'package:rent_chicken/core/results/result.dart';
// import 'package:rent_chicken/core/usecase/usecase.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';

// import '../../../../core/params/base_params.dart';

// class GetMessagesParams extends BaseParams {
//   final int conversationId;
//   final GetListRequest request;
//   GetMessagesParams({required this.request, required this.conversationId});
// }

// class GetMessagesUseCase
//     extends UseCase<List<LastMessageModel>, GetMessagesParams> {
//   final ChatRepository repository;
//   GetMessagesUseCase(this.repository);

//   @override
//   Future<Result<List<LastMessageModel>>> call(
//       {required GetMessagesParams params}) {
//     return repository.getAllMessagesByConversation(params: params);
//   }
// }
