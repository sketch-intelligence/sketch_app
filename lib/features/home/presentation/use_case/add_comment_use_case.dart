import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';

class AddCommentParams extends BaseParams {
  int postId;
  int userId;
  String text;
  AddCommentParams({
    required this.postId,
    required this.userId,
    required this.text,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
      'text': text,
    };
  }
}

class AddCommentUseCase extends UseCase<String, AddCommentParams> {
  final HomeRepository homeRepository;

  AddCommentUseCase({required this.homeRepository});
  @override
  Future<Result<String>> call({required AddCommentParams params}) {
    return homeRepository.addComment(params: params);
  }
}
