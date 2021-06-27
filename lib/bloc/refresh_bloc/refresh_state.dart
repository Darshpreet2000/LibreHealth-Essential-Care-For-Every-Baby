part of 'refresh_bloc.dart';

abstract class RefreshState {
  const RefreshState();

}

class RefreshInitial extends RefreshState {}

class RefreshLoading extends RefreshState {}

class RefreshLoaded extends RefreshState {}

class RefreshError extends RefreshState {
  final String message;

  RefreshError(this.message);

}
