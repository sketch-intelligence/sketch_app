// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';

class GetProfileParams extends BaseParams {
  int userId;
  GetProfileParams({required this.userId});
}

class GetProfileUseCase extends UseCase<ProfileModel, GetProfileParams> {
  ProfileRepository repository;
  GetProfileUseCase({
    required this.repository,
  });
  @override
  Future<Result<ProfileModel>> call({required GetProfileParams params}) {
    return repository.getProfile(params: params);
  }
}
