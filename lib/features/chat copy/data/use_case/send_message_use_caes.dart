// import 'dart:io';

// import 'package:rent_chicken/core/results/result.dart';
// import 'package:rent_chicken/core/usecase/usecase.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';

// import '../../../../core/params/base_params.dart';

// class ChatParams extends BaseParams {
//   final int senderId;
//   final int recieverId;
//   final String msg;
//   final List<File> photos;
//   final List<File> videos;

//   ChatParams(
//       {required this.photos,
//       required this.videos,
//       required this.senderId,
//       required this.recieverId,
//       required this.msg});
//   toJson() {
//     return {
//       "sender": senderId,
//       "receiver": recieverId,
//       "message": msg,
//       "_method": "put",
//       if (videos.isNotEmpty) 'MnD': 'MnD'
//     };
//   }
// }

// class SendMessageUseCase extends UseCase<LastMessageModel, ChatParams> {
//   final ChatRepository repository;
//   SendMessageUseCase(this.repository);

//   @override
//   Future<Result<LastMessageModel>> call({required ChatParams params}) {
//     return repository.sendMessage(params: params);
//   }
// }
