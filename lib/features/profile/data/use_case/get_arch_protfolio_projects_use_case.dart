import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';

class GetArchProtfolioProjectsParams extends BaseParams {
  int? archId;
  GetArchProtfolioProjectsParams({
    this.archId,
  });
}

class GetArchProtfolioProjectsUseCase
    extends UseCase<ListPortfolioProjectModel, GetArchProtfolioProjectsParams> {
  final ProfileRepository profileRepository;

  GetArchProtfolioProjectsUseCase({required this.profileRepository});
  @override
  Future<Result<ListPortfolioProjectModel>> call(
      {required GetArchProtfolioProjectsParams params}) {
    return profileRepository.getArchPortfolioProject(params: params);
  }
}
