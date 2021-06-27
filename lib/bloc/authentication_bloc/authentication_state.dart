part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoaded extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError(this.message);
}
