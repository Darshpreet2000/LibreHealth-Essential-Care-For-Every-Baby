part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLoginEvent extends AuthenticationEvent {
  final String username;
  final String password;
  final String server;
  final String orgUnit;
  AuthenticationLoginEvent(this.username, this.password, this.server,this.orgUnit);
}
