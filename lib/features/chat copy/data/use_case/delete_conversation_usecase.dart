// import 'package:rent_chicken/core/params/base_params.dart';
// import 'package:rent_chicken/core/usecase/usecase.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';

// import '../../../../core/results/result.dart';

// class DeleteConversationParams extends BaseParams {
//   final int conversationId;

//   DeleteConversationParams({
//     required this.conversationId,
//   });
// }

// class DeleteConversationUseCase
//     extends UseCase<String, DeleteConversationParams> {
//   final ChatRepository repository;
//   DeleteConversationUseCase(this.repository);

//   @override
//   Future<Result<String>> call({required DeleteConversationParams params}) {
//     return repository.deleteConversation(params: params);
//   }
// }
