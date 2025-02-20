import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/profile/data/models/temp_model/temp_model.dart';
import 'package:sketch/features/profile/data/use_case/add_follow_use_case.dart';
import 'package:sketch/features/profile/data/use_case/add_portfolio_project_use_case.dart';
import 'package:sketch/features/profile/data/use_case/add_post_use_case.dart';
import 'package:sketch/features/profile/data/use_case/add_user_project_use_case.dart';
import 'package:sketch/features/profile/data/use_case/get_arch_protfolio_projects_use_case.dart';
import 'package:sketch/features/profile/data/use_case/get_profile_use_case.dart';
import 'package:sketch/features/profile/data/use_case/update_profile_pic.dart';

class ProfileRepository extends CoreRepository {
  Future<Result<ProfileModel>> getProfile(
      {required GetProfileParams params}) async {
    final result = await RemoteDataSource.request<ProfileModel>(
      responseStr: 'GetProfile',
      withAuthentication: true,
      converter: (json) => ProfileModel.fromJson(json),
      method: HttpMethod.GET,
      url: "$getProfileUrl/${params.userId}",
    );
    return call(result: result);
  }

  Future<Result<String>> addFollow({required AddFollowParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      withAuthentication: true,
      queryParameters: params.toJson(),
      method: HttpMethod.POST,
      url: addFollowUrl,
    );
    return noModelCall(result: result);
  }

  Future<Result<String>> addUserProject(
      {required AddUserProjectParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      withAuthentication: true,
      data: params.toJson(),
      method: HttpMethod.POST,
      url: '${baseUrl}user-projects',
    );
    return noModelCall(result: result);
  }

  Future<Result<PostModel>> addPost({required AddPostParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        responseStr: 'postResult',
        file: params.image,
        fileKey: 'images',
        data: params.toJson(),
        method: HttpMethod.POST,
        url: '${baseUrl}posts/add',
        converter: (json) => PostModel.fromJson(json['data']));
    return call(result: result);
  }

  Future<Result<TempModel>> updateProfilePic(
      {required UpdateProfilePicParams params}) async {
    final result = await RemoteDataSource.request(
        withAuthentication: true,
        responseStr: 'picResult',
        file: params.coverImage != null ? params.coverImage : null,
        fileKey: params.coverImage != null ? 'profileImage' : null,
        secondFile: params.profileImage != null ? params.profileImage : null,
        secondFileKey: params.coverImage != null ? 'coverImage' : null,
        data: params.toJson(),
        method: HttpMethod.POST,
        url: '${baseUrl}users/update-user',
        converter: (json) => TempModel.fromJson(json['data']));
    return call(result: result);
  }

  Future<Result<ListPortfolioProjectModel>> getArchPortfolioProject(
      {required GetArchProtfolioProjectsParams params}) async {
    final result = await RemoteDataSource.request<ListPortfolioProjectModel>(
      responseStr: 'GetProfile',
      withAuthentication: true,
      converter: (json) => ListPortfolioProjectModel.fromJson(json),
      method: HttpMethod.GET,
      url: "${baseUrl}portfolio-projects/architect/${params.archId}",
    );
    return call(result: result);
  }

  Future<Result<PortfolioProjectModel>> addPortfolioProject(
      {required AddPortfolioProjectParams params}) async {
    final result = await RemoteDataSource.request<PortfolioProjectModel>(
      method: HttpMethod.POST,
      responseStr: 'AddPortfolioProject',
      file: params.image,
      fileKey: 'images',
      data: params.toJson(),
      url: '${baseUrl}portfolio-projects',
      withAuthentication: true,
      converter: (json) => PortfolioProjectModel.fromJson(json['data']),
    );
    return call(result: result);
  }
}
