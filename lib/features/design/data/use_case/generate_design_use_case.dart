// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:sketch/core/params/base_params.dart';
// import 'package:sketch/core/results/result.dart';
// import 'package:sketch/core/usecase/usecase.dart';
// import 'package:sketch/features/design/data/model/design_model.dart';
// import 'package:sketch/features/design/repository/design_repository.dart';

// class GenerateDesginParams extends BaseParams {
//   String description;
//   GenerateDesginParams({required this.description});
//   Map<String, dynamic> toJson() {
//     return {'description': description};
//   }
// }

// class GenerateDesignUseCase extends UseCase<DesignModel, GenerateDesginParams> {
//   DesignRepository designRepository;
//   GenerateDesignUseCase({
//     required this.designRepository,
//   });
//   @override
//   Future<Result<DesignModel>> call({required GenerateDesginParams params}) {
//     return designRepository.generateDesign(params: params);
//   }
// }
