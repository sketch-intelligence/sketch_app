// import 'package:rent_chicken/core/params/base_params.dart';
// import 'package:rent_chicken/core/results/result.dart';
// import 'package:rent_chicken/core/usecase/usecase.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';

// import '../model/conversation_model.dart';

// class GetSupportMsgParams extends BaseParams {
//   GetSupportMsgParams();
// }

// class GetSupportUseCase
//     extends UseCase<ConversationModel, GetSupportMsgParams> {
//   final ChatRepository repository;
//   GetSupportUseCase(this.repository);

//   @override
//   Future<Result<ConversationModel>> call(
//       {required GetSupportMsgParams params}) {
//     return repository.getSupportMessage(params: params);
//   }
// }
