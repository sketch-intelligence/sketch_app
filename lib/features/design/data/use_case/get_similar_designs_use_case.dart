// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/design/data/model/similar_desgin.dart';
import 'package:sketch/features/design/repository/design_repository.dart';

class GetSimilarDesignParams extends BaseParams {
  File? image;
  GetSimilarDesignParams({
    this.image,
  });
}

class GetSimilarDesignsUseCase
    extends UseCase<ListSimilarDesign, GetSimilarDesignParams> {
  DesignRepository designRepository;
  GetSimilarDesignsUseCase({required this.designRepository});
  @override
  Future<Result<ListSimilarDesign>> call(
      {required GetSimilarDesignParams params}) {
    return designRepository.getSimilarDesigns(params: params);
  }
}
