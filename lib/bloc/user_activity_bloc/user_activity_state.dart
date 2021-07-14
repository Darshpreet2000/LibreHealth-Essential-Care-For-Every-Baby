part of 'user_activity_bloc.dart';

abstract class UserActivityState {
  const UserActivityState();
}

class UserActivityLoading extends UserActivityState {}

class UserActivityLoaded extends UserActivityState {
  final List<UserActivity> userActivityList;

  UserActivityLoaded(this.userActivityList);
}

class UserActivityError extends UserActivityState {
  final String error;

  UserActivityError(this.error);
}
