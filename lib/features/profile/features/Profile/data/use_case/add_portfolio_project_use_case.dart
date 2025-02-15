// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/features/Profile/data/models/portfolio_project_model/portfolio_project_model.dart';
import 'package:sketch/features/profile/features/Profile/data/repository/profile_repository.dart';

class AddPortfolioProjectParams extends BaseParams {
  int? archId;
  File? image;
  String? title;
  String? description;
  var compDate;
  AddPortfolioProjectParams({
    this.archId,
    this.image,
    this.title,
    this.description,
  });
  Map<String, dynamic> toJson() {
    return {
      'architectId': archId,
      'title': title,
      'description': description,
    };
  }
}

class AddPortfolioProjectUseCase
    extends UseCase<PortfolioProjectModel, AddPortfolioProjectParams> {
  final ProfileRepository profileRepository;

  AddPortfolioProjectUseCase({required this.profileRepository});
  @override
  Future<Result<PortfolioProjectModel>> call(
      {required AddPortfolioProjectParams params}) {
    return profileRepository.addPortfolioProject(params: params);
  }
}
