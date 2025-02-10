// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sketch/core/params/base_params.dart';
import 'package:sketch/core/results/result.dart';
import 'package:sketch/core/usecase/usecase.dart';
import 'package:sketch/features/payment_imp/repository/payment_repository.dart';

class AddToBalanceParams extends BaseParams {
  double? amount;
  int? userId;
  AddToBalanceParams({this.amount, this.userId});
  Map<String, dynamic> toJson() {
    return {'amount': amount, 'userId': userId};
  }
}

class AddToBalanceUseCase extends UseCase<String, AddToBalanceParams> {
  PaymentRepository repository;
  AddToBalanceUseCase({
    required this.repository,
  });
  @override
  Future<Result<String>> call({required AddToBalanceParams params}) {
    return repository.addToBalance(params);
  }
}
