part of 'register_baby_bloc.dart';

abstract class RegisterBabyEvent extends Equatable {
  const RegisterBabyEvent();
}

class ChangeChildrenCount extends RegisterBabyEvent {
  final int children;

  ChangeChildrenCount(this.children);
  @override
  List<Object> get props => [children];
}

class RegisterBaby extends RegisterBabyEvent {
  @override
  List<Object> get props => [];
}
