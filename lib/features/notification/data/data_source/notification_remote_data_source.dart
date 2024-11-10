// import 'package:sketch/core/utils/api_service.dart';
// import 'package:sketch/features/notification/data/model/notificatioin_model.dart';

// abstract class NotificationRemoteDataSource {
//   Future<List<NotificationModel>> fetchNotification();
//   Future<List<NotificationModel>> fetchUnreadNotification();
// }

// class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
//   final ApiService api;

//   NotificationRemoteDataSourceImpl({required this.api});
//   @override
//   Future<List<NotificationModel>> fetchNotification() async {
//     List<NotificationModel> notification = [];
//     var result = await api.get(endPoint: 'endPoint');
//   }

//   @override
//   Future<List<NotificationModel>> fetchUnreadNotification() {}
// }
