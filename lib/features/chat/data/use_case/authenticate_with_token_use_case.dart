import 'package:sketch/core/params/base_params.dart';

class AuthWithTokenParams extends BaseParams {
  String? token;
  AuthWithTokenParams({this.token});
}

// class AuthWithTokenUseCase {
//   final ChatRepository chatRepository;

//   AuthWithTokenUseCase({required this.chatRepository});

//   Future<void> call({required AuthWithTokenParams params}) {
//     return authenticateUserWithToken(params);
//   }
// }
