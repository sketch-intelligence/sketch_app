import 'dart:typed_data';

import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/home/presentation/repository/home_repository.dart';

class ImageModel {
  final Uint8List imageData;

  ImageModel({required this.imageData});

  factory ImageModel.fromBinary(Uint8List bytes) {
    return ImageModel(imageData: bytes);
  }
}

class GetImageParams extends BaseParams {
  final String imageName;

  GetImageParams({required this.imageName});
}

class GetImageUseCase extends UseCase<ImageModel, GetImageParams> {
  final HomeRepository homeRepository;

  GetImageUseCase({required this.homeRepository});
  @override
  Future<Result<ImageModel>> call({required GetImageParams params}) {
    return homeRepository.getImage(params: params);
  }
}
