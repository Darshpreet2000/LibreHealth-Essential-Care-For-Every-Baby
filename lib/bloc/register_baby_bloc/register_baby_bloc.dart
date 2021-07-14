import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/repository/register_baby_repository.dart';

part 'register_baby_event.dart';
part 'register_baby_state.dart';

class RegisterBabyBloc extends Bloc<RegisterBabyEvent, RegisterBabyState> {
  RegisterBabyModel _registerBabyModel;
  RegisterBabyRepositoryImpl _registerBabyRepositoryImpl;
  NotificationRepository notificationRepository;
  RegisterBabyBloc(this._registerBabyModel, this._registerBabyRepositoryImpl,
      this.notificationRepository)
      : super(RegisterBabyInitialState(_registerBabyModel));

  @override
  Stream<RegisterBabyState> mapEventToState(
    RegisterBabyEvent event,
  ) async* {
    if (event is ChangeChildrenCount) {
      _registerBabyModel.children = [];
      for (int i = 0; i < event.children; i++) {
        _registerBabyModel.children.add(new BabyDetailsModel());
      }
      yield RegisterBabyInitialState(_registerBabyModel);
    } else if (event is RegisterBaby) {
      try {
        // check if data is filled correctly
        await _registerBabyRepositoryImpl
            .checkDataEnteredCorrectly(_registerBabyModel);
        // register each baby details
        await _registerBabyRepositoryImpl.registerAllBabies(
            _registerBabyModel, notificationRepository);

        _registerBabyModel = new RegisterBabyModel();
        yield RegisterBabyRegisteredState();
        yield RegisterBabyInitialState(_registerBabyModel);
      } catch (e) {
        yield RegisterBabyErrorState(e.toString());
        yield RegisterBabyInitialState(_registerBabyModel);
      }
    }
  }
}
