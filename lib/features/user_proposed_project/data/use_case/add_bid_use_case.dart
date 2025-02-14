// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/user_proposed_project/data/repository/projects_repository.dart';

class AddBidParams extends BaseParams {
  int? projectId;
  double? price;
  int? expectedDuration;
  String? description;
  AddBidParams({
    this.projectId,
    this.price,
    this.expectedDuration,
    this.description,
  });
  Map<String, dynamic> toJson() {
    return {
      "projectId": projectId,
      "price": price,
      "expectedDuration": expectedDuration,
      "description": description
    };
  }
}

class AddBidUseCase extends UseCase<String, AddBidParams> {
  ProjectsRepository repository;
  AddBidUseCase({
    required this.repository,
  });
  @override
  Future<Result<String>> call({required AddBidParams params}) {
    return repository.addBid(params: params);
  }
}
