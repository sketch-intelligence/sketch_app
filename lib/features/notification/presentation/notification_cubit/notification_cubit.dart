import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sketch/features/notification/data/model/notificatioin_model.dart';
import 'package:sketch/features/notification/domain/repositories/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;
  NotificationCubit({required this.repository}) : super(NotificationInitial());

  Future<void> fetchNotification() async {}
}
