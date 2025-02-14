// import 'package:sketch/core/params/base_params.dart';
// import 'package:sketch/core/results/result.dart';
// import 'package:sketch/core/usecase/usecase.dart';
// import 'package:sketch/features/home/data/models/post_model/post_model.dart';
// import 'package:sketch/features/home/presentation/repository/home_repository.dart';

// class GetUserProjectsParams extends BaseParams {
//   int? id;
//   GetUserProjectsParams({required this.id});
// }

// class GetUserPostsUseCase
//     extends UseCase<ListUserPostModelModel, GetUserProjectsParams> {
//   final HomeRepository homeRepository;

//   GetUserPostsUseCase({required this.homeRepository});
//   @override
//   Future<Result<ListUserPostModelModel>> call(
//       {required GetUserPostsParams params}) {
//     return homeRepository.getAllUserPosts(params: params);
//   }
// }
