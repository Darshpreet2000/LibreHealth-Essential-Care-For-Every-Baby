import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:newborn_care/models/notification_model.dart';
import 'package:newborn_care/repository/notification_screen_repository.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationScreenRepository notificationScreenRepository;
  NotificationBloc(this.notificationScreenRepository)
      : super(NotificationLoading());

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    yield NotificationLoading();
    if (event is FetchNofiticationOfBabies) {
      List<NotificationModel> monitoringAlerts =
          notificationScreenRepository.fetchMonitoringAlerts();

      List<NotificationModel> riskAssessments =
          notificationScreenRepository.fetchRiskAssessmentsList();

      yield NotificationLoaded(monitoringAlerts, riskAssessments);
    }
  }
}
