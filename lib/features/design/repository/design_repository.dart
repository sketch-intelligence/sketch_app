import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/design/data/model/similar_desgin.dart';
import 'package:sketch/features/design/data/use_case/get_similar_designs_use_case.dart';

class DesignRepository extends CoreRepository {
  Future<Result<ListSimilarDesign>> getSimilarDesigns(
      {required GetSimilarDesignParams params}) async {
    final result = await RemoteDataSource.request<ListSimilarDesign>(
        responseStr: 'GenerateDesignRes',
        // data: params.toJson(),
        file: params.image,
        withAuthentication: false,
        // isImageResponse:true;
        converter: (json) => ListSimilarDesign.fromJson(json),
        method: HttpMethod.POST,
        url: 'https://ac46-34-23-227-33.ngrok-free.app/predict');

    return call(result: result);
  }
}
