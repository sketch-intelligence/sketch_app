import 'package:sketch/core/constant/end_points/api_url.dart';
import 'package:sketch/core/data_source/remote_data_source.dart';
import 'package:sketch/core/http/http_method.dart';
import 'package:sketch/core/repository/core_repository.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/features/payment_imp/use_case/add_to_balance_use_case.dart';

class PaymentRepository extends CoreRepository {
  Future<Result<String>> addToBalance(AddToBalanceParams params) async {
    final result = await RemoteDataSource.noModelRequest(
        method: HttpMethod.POST,
        url: '$balanceUrl/add',
        withAuthentication: true,
        data: params.toJson());

    return noModelCall(result: result);
  }
}
