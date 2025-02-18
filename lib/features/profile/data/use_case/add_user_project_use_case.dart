import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';

class AddUserProjectParams extends BaseParams {
  String? title;
  String? description;
  double? budget;
  String? deadline;
  int? userId;
  AddUserProjectParams(
      {this.title, this.description, this.budget, this.deadline, this.userId});
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "budget": budget,
      "deadline": deadline,
      "architectId": userId
    };
  }
}

class AddUserProjectUseCase extends UseCase<String, AddUserProjectParams> {
  final ProfileRepository profileRepository;

  AddUserProjectUseCase({required this.profileRepository});
  @override
  Future<Result<String>> call({required AddUserProjectParams params}) {
    return profileRepository.addUserProject(params: params);
  }
}
