import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';
import 'package:sketch/features/project/user_proposed_project/data/model/user_proposed_project_model/user_proposed_project_model.dart';

class GetUserProjectsParams extends BaseParams {
  int? id;
  GetUserProjectsParams({required this.id});
}

class GetUserProjectsUseCase
    extends UseCase<ListUserProposedProjectModel, GetUserProjectsParams> {
  final HomeRepository homeRepository;

  GetUserProjectsUseCase({required this.homeRepository});
  @override
  Future<Result<ListUserProposedProjectModel>> call(
      {required GetUserProjectsParams params}) {
    return homeRepository.getUserProjects(params: params);
  }
}
