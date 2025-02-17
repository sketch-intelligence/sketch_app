// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/home/data/models/post_model/comment.dart';
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

class GetPostCommentsParams extends BaseParams {
  int postId;

  GetPostCommentsParams({
    required this.postId,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
    };
  }
}

class GetPostCommentsUseCase
    extends UseCase<ListComment, GetPostCommentsParams> {
  final HomeRepository homeRepository;

  GetPostCommentsUseCase({required this.homeRepository});
  @override
  Future<Result<ListComment>> call({required GetPostCommentsParams params}) {
    return homeRepository.getPostComments(params: params);
  }
}
