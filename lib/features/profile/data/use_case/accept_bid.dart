// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/profile/data/repository/profile_repository.dart';

class AcceptParams extends BaseParams {
  int? pid;
  int? bid;
  int? uid;
  AcceptParams({
    this.pid,
    this.bid,
    this.uid,
  });
}

class AcceptBid extends UseCase<String, AcceptParams> {
  final ProfileRepository profileRepository;

  AcceptBid({required this.profileRepository});

  @override
  Future<Result<String>> call({required AcceptParams params}) {
    return profileRepository.acceptBid(params: params);
  }
}
