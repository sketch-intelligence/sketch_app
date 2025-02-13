// import 'package:rent_chicken/core/params/base_params.dart';
// import 'package:rent_chicken/core/results/result.dart';
// import 'package:rent_chicken/core/usecase/usecase.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';

// class GetConversationByOneParams extends BaseParams {
//   final int msgId;

//   GetConversationByOneParams({
//     required this.msgId,
//   });
// }

// class GetConversationByOneUseCase
//     extends UseCase<LastMessageModel, GetConversationByOneParams> {
//   final ChatRepository repository;
//   GetConversationByOneUseCase(this.repository);

//   @override
//   Future<Result<LastMessageModel>> call(
//       {required GetConversationByOneParams params}) {
//     return repository.getConversationByOne(params: params);
//   }
// }
