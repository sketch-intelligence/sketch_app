import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/bids/bids.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';
import 'package:sketch/features/project/user_proposed_project/data/use_case/add_bid_use_case.dart';
import 'package:sketch/features/project/user_proposed_project/data/use_case/get_all_user_projects_use_case.dart';
import 'package:sketch/features/project/user_proposed_project/data/use_case/get_project_bids_use_case.dart';

class ProjectsRepository extends CoreRepository {
  Future<Result<String>> addBid({required AddBidParams params}) async {
    final result = await RemoteDataSource.noModelRequest(
      method: HttpMethod.POST,
      data: params.toJson(),
      url: '${baseUrl}bids/place',
      withAuthentication: true,
    );
    return noModelCall(result: result);
  }

  Future<Result<ListUserProposedProjectModel>> getAllUserProjects(
      {required GetAllUserProjectsParams params}) async {
    final result = await RemoteDataSource.request<ListUserProposedProjectModel>(
        method: HttpMethod.GET,
        responseStr: 'ListGetAllUserProjects',
        url: '${baseUrl}user-projects',
        withAuthentication: true,
        converter: (json) => ListUserProposedProjectModel.fromJson(json));
    return call(result: result);
  }

  Future<Result<ListBids>> getProjectBids(
      {required GetProjectBidsParams params}) async {
    final result = await RemoteDataSource.request(
        method: HttpMethod.GET,
        responseStr: 'ListBidModel',
        url: '${baseUrl}bids/project/${params.projectId}',
        withAuthentication: true,
        converter: (json) => ListBids.fromJson(json));
    return call(result: result);
  }
}
