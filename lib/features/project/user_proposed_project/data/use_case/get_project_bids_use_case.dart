import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/bids/bids.dart';
import 'package:sketch/features/project/user_proposed_project/data/repository/projects_repository.dart';

class GetProjectBidsParams extends BaseParams {
  int? projectId;
  GetProjectBidsParams({this.projectId});
}

class GetProjectBidsUseCase extends UseCase<ListBids, GetProjectBidsParams> {
  final ProjectsRepository projectsRepository;

  GetProjectBidsUseCase({required this.projectsRepository});
  @override
  Future<Result<ListBids>> call({required GetProjectBidsParams params}) {
    return projectsRepository.getProjectBids(params: params);
  }
}
