import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';
import 'package:sketch/features/user_proposed_project/data/repository/projects_repository.dart';

class GetAllUserProjectsParams extends BaseParams {
  GetAllUserProjectsParams();
}

class GetAllUserProjectsUseCase
    extends UseCase<ListUserProposedProjectModel, GetAllUserProjectsParams> {
  ProjectsRepository repository;

  GetAllUserProjectsUseCase({
    required this.repository,
  });
  @override
  Future<Result<ListUserProposedProjectModel>> call(
      {required GetAllUserProjectsParams params}) {
    return repository.getAllUserProjects(params: params);
  }
}
