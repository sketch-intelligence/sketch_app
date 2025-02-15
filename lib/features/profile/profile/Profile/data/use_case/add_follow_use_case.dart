// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/profile/Profile/data/repository/profile_repository.dart';

class AddFollowParams extends BaseParams {
  int followerId;
  int followingId;
  AddFollowParams({required this.followerId, required this.followingId});

  Map<String, dynamic> toJson() {
    return {'followingId': followerId, 'followerId': followerId};
  }
}

class AddFollowUseCase extends UseCase<String, AddFollowParams> {
  ProfileRepository repository;
  AddFollowUseCase({
    required this.repository,
  });
  @override
  Future<Result<String>> call({required AddFollowParams params}) {
    return repository.addFollow(params: params);
  }
}
