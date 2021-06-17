part of 'register_baby_bloc.dart';

abstract class RegisterBabyState {
  const RegisterBabyState();
}

class RegisterBabyInitialState extends RegisterBabyState {
  final RegisterBabyModel _registerBabyModel;

  RegisterBabyInitialState(this._registerBabyModel);

  get getRegisterModel => _registerBabyModel;
}

class RegisterBabyLoadingState extends RegisterBabyState {}

class RegisterBabyErrorState extends RegisterBabyState {
  final String? message;

  RegisterBabyErrorState(this.message);
}
