// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/chat/data/model/custom_token_model.dart';
import 'package:sketch/features/chat/data/repository/chat_repository.dart';

class GetTokenParams extends BaseParams {
  String? uid;
  GetTokenParams({
    this.uid,
  });
  Map<String, dynamic> toJson() {
    return {'uid': uid};
  }
}

class GetTokenUseCase extends UseCase<CustomTokenModel, GetTokenParams> {
  final ChatRepository chatRepository;

  GetTokenUseCase({required this.chatRepository});
  @override
  Future<Result<CustomTokenModel>> call({required GetTokenParams params}) {
    return chatRepository.getToken(params: params);
  }
}
