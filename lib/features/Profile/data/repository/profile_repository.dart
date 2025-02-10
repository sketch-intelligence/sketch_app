import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/Profile/data/models/profile_model/profile_model.dart';
import 'package:sketch/features/Profile/data/use_case/get_profile_use_case.dart';

class ProfileRepository extends CoreRepository {
  Future<Result<ProfileModel>> getProfile(
      {required GetProfileParams params}) async {
    final result = await RemoteDataSource.request<ProfileModel>(
      responseStr: 'GetProfile',
      converter: (json) => ProfileModel.fromJson(json),
      method: HttpMethod.GET,
      url: "$getProfileUrl/${params.userId}",
    );
    return call(result: result);
  }
}
