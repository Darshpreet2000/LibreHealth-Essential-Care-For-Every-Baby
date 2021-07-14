part of 'refresh_bloc.dart';

abstract class RefreshEvent {
  const RefreshEvent();
}

class RefreshEventStart extends RefreshEvent {}
