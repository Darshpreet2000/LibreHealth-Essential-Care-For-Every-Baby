part of 'user_activity_bloc.dart';

abstract class UserActivityEvent extends Equatable {
  const UserActivityEvent();

  @override
  List<Object> get props => [];
}

class UserActivityFetch extends UserActivityEvent {}

class UserActivityAddNotification extends UserActivityEvent {
  final UserActivity notifications;

  UserActivityAddNotification(this.notifications);
}
