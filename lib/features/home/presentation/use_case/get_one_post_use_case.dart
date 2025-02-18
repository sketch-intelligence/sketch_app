import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';

class GetOnePostParams extends BaseParams {
  final int postId;

  GetOnePostParams({required this.postId});

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
    };
  }
}

class GetOnePostsUseCase extends UseCase<PostModel, GetOnePostParams> {
  final HomeRepository repository;

  GetOnePostsUseCase(this.repository);

  @override
  Future<Result<PostModel>> call({required GetOnePostParams params}) {
    return repository.getOnePost(params: params);
  }
}
