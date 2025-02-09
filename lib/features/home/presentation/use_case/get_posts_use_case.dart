import 'package:sketch/core/boilerplate/pagination/models/get_list_request.dart';
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';

class GetPostsParams extends BaseParams {
  final GetListRequest request;

  GetPostsParams({required this.request});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data.addAll(request.toJson());
    return data;
  }
}

class GetAllPostsUseCase extends UseCase<List<PostModel>, GetPostsParams> {
  final HomeRepository repository;

  GetAllPostsUseCase(this.repository);

  @override
  Future<Result<List<PostModel>>> call({required GetPostsParams params}) {
    return repository.getAllPosts(params: params);
  }
}
