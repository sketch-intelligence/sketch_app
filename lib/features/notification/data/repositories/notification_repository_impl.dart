// import 'package:dartz/dartz.dart';
// import 'package:sketch/core/errors/failure.dart';
// import 'package:sketch/features/home/presentation/data/models/person_model.dart';
// import 'package:sketch/features/notification/data/model/notificatioin_model.dart';
// import 'package:sketch/features/notification/data/model/notification_type.dart';
// import 'package:sketch/features/notification/domain/repositories/notification_repository.dart';

// class NotificationRepositoryImpl extends NotificationRepository {
//   @override
//   Future<Either<Failure, List<NotificationModel>>>
//       fetchAllNotifications() async {
//     try {
//       // Await the result from loginUser in authRemoteDataSource
//       await authRemoteDataSource.loginUser(
//           password: password, username: username);

//       return right(unit); // Return Unit from dartz if successful
//     } catch (e) {
//       print("Error in loginUser: $e"); // Logging the error
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString())); // Return the error message
//     }

//     final people = [
//       PersonModel(userName: 'Jennie Ponce'),
//       PersonModel(userName: 'Sally Rooney'),
//       PersonModel(userName: 'Liam Pham'),
//       PersonModel(userName: 'Kristin Watson'),
//       PersonModel(userName: 'Jena Nguyen'),
//       PersonModel(userName: 'Anja O\'Connor'),
//     ];

//     return [
//       NotificationModel(
//         person: people[0],
//         message: 'liked your video',
//         description: 'Laborum aliqua do nostrud ...',
//         date: DateTime.now().subtract(const Duration(minutes: 10)),
//         type: NotificationType.like,
//         isRead: false,
//       ),
//       NotificationModel(
//         person: people[1],
//         message: 'added a photo',
//         description: 'In pariatur laborum adipisci ...',
//         date: DateTime.now().subtract(const Duration(minutes: 10)),
//         type: NotificationType.like,
//         isRead: false,
//       ),
//       NotificationModel(
//         person: people[2],
//         message: 'commented on your post',
//         description: 'Cillum Lorem aliqua laboris ...',
//         date: DateTime.now().subtract(const Duration(minutes: 20)),
//         type: NotificationType.comment,
//         isRead: false,
//       ),
//       NotificationModel(
//         person: people[3],
//         message: 'liked your post',
//         description: 'Cillum Lorem aliqua laboris ...',
//         date: DateTime.now().subtract(const Duration(minutes: 10)),
//         type: NotificationType.like,
//         isRead: true,
//       ),
//       // Add more notifications as needed
//     ];
//   }

//   @override
//   Future<Either<Failure, List<NotificationModel>>>
//       fetchUnreadNotifications() async {
//     final allNotifications = await fetchAllNotifications();
//     return allNotifications
//         .where((notification) => !notification.isRead)
//         .toList();
//   }
// }
