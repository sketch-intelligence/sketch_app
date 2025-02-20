import 'dart:io';

import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/data/models/temp_model/temp_model.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';

class UpdateProfilePicParams extends BaseParams {
  File? profileImage;
  File? coverImage;
  String? name;
  UpdateProfilePicParams({this.profileImage, this.coverImage, this.name});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class UpdateProfilePicUseCase
    extends UseCase<TempModel, UpdateProfilePicParams> {
  final ProfileRepository profileRepository;

  UpdateProfilePicUseCase({required this.profileRepository});
  @override
  Future<Result<TempModel>> call({required UpdateProfilePicParams params}) {
    return profileRepository.updateProfilePic(params: params);
  }
}
