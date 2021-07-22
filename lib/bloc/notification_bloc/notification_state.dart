part of 'notification_bloc.dart';

abstract class NotificationState {
  const NotificationState();
}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel> monitoringAlerts, riskAssessments;

  NotificationLoaded(this.monitoringAlerts, this.riskAssessments);
}
