part of 'user_activity_bloc.dart';

abstract class UserActivityState extends Equatable {
  const UserActivityState();

  @override
  List<Object> get props => [];
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
