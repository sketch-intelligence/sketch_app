import 'package:http/http.dart' as http;
import 'package:sketch/core/classes/cashe_helper.dart';
import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/home/data/models/post_model/comment.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/home/presentation/use_case/add_comment_use_case.dart';
import 'package:sketch/features/home/presentation/use_case/get_image_use_case.dart';
import 'package:sketch/features/home/presentation/use_case/get_one_post_use_case.dart';
import 'package:sketch/features/home/presentation/use_case/get_post_comments_use_case.dart';
import 'package:sketch/features/home/presentation/use_case/get_posts_use_case.dart';
import 'package:sketch/features/profile/data/use_case/get_user_posts_use_case.dart';
import 'package:sketch/features/profile/data/use_case/get_user_projects_use_case.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';

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

  Future<Result<ListUserPostModelModel>> getAllUserPosts(
      {required GetUserPostsParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        url: "${baseUrl}posts/user/${params.id}/posts",
        method: HttpMethod.GET,
        responseStr: 'PostsResponse',
        converter: (json) {
          return ListUserPostModelModel.fromJson(json);
        });
    return call(result: result);
  }

  Future<Result<ListComment>> getPostComments(
      {required GetPostCommentsParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        url: "${baseUrl}comments/post/comments",
        method: HttpMethod.GET,
        queryParameters: params.toJson(),
        responseStr: 'commentsResponse',
        converter: (json) {
          return ListComment.fromJson(json);
        });
    return call(result: result);
  }

  Future<Result<PostModel>> getOnePost(
      {required GetOnePostParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        url: "${baseUrl}posts/post",
        method: HttpMethod.GET,
        queryParameters: params.toJson(),
        responseStr: 'postRes',
        converter: (json) {
          return PostModel.fromJson(json);
        });
    return call(result: result);
  }

  Future<Result<String>> addComment({required AddCommentParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      withAuthentication: true,
      url: "${baseUrl}comments/comment/add",
      data: params.toJson(),
      method: HttpMethod.POST,
    );
    return noModelCall(result: result);
  }

  Future<Result<ImageModel>> getImage({required GetImageParams params}) async {
    try {
      final String token = CacheHelper.token!;
      final response = await http.get(
        Uri.parse(
          "${baseUrl}posts/uploads/${params.imageName}",
        ),
        headers: {
          "Authorization": "Bearer $token", // Add token to headers
        },
      );

      if (response.statusCode == 200) {
        return Result(data: ImageModel.fromBinary(response.bodyBytes));
      } else {
        print("Failed to load image. Status Code: ${response.statusCode}");
        return Result(error: "Failed to load image");
      }
    } catch (e) {
      print("Error fetching image: $e");
      return Result(error: "Error fetching image");
    }
  }

  Future<Result<ListUserProposedProjectModel>> getUserProjects(
      {required GetUserProjectsParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        url: "${baseUrl}users/${params.id}/projects",
        method: HttpMethod.GET,
        responseStr: 'ProjectsResponse',
        converter: (json) {
          return ListUserProposedProjectModel.fromJson(json);
        });
    return call(result: result);
  }
}
