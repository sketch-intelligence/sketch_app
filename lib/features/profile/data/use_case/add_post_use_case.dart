// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/home/data/models/post_model/post_model.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';

class AddPostParams extends BaseParams {
  int? ownerId;
  String? text;
  File? image;
  DateTime? timeStamp;
  AddPostParams({
    this.ownerId,
    this.text,
    this.image,
    this.timeStamp,
  });
  Map<String, dynamic> toJson() {
    print('time time time $timeStamp');
    return {
      'ownerId': ownerId,
      'text': text,
      "timeStamp": timeStamp?.toIso8601String(),
    };
  }
}

class AddPostUseCase extends UseCase<PostModel, AddPostParams> {
  final ProfileRepository profileRepository;

  AddPostUseCase({required this.profileRepository});
  @override
  Future<Result<PostModel>> call({required AddPostParams params}) {
    return profileRepository.addPost(params: params);
  }
}
