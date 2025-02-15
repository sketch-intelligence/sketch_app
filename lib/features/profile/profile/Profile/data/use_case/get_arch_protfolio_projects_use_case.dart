// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/profile/Profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/profile/profile/Profile/data/repository/profile_repository.dart';

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
