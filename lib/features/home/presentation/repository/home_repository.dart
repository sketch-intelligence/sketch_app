import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/use_case/get_posts_use_case.dart';

class HomeRepository extends CoreRepository {
  Future<Result<List<PostModel>>> getAllPosts(
      {required GetPostsParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        url: postsUrl,
        queryParameters: params.toJson(),
        method: HttpMethod.GET,
        responseStr: 'PostsResponse',
        converter: (json) {
          return json['data'] is List
              ? ListPostModelModel(data: [])
              : ListPostModelModel.fromJson(json['data']);
        });
    return paginatedCall(result: result);
  }
}
