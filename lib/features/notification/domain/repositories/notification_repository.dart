import 'package:dartz/dartz.dart';
import 'package:sketch/core/errors/failure.dart';
import 'package:sketch/features/notification/data/model/notificatioin_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationModel>>> fetchAllNotifications();
  Future<Either<Failure, List<NotificationModel>>> fetchUnreadNotifications();
}
