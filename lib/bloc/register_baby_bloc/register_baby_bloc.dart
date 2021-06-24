import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/repository/register_baby_repository.dart';

part 'register_baby_event.dart';
part 'register_baby_state.dart';

class RegisterBabyBloc extends Bloc<RegisterBabyEvent, RegisterBabyState> {
  RegisterBabyModel _registerBabyModel;
  RegisterBabyRepositoryImpl _registerBabyRepositoryImpl;
  RegisterBabyBloc(this._registerBabyModel, this._registerBabyRepositoryImpl)
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
      // check if data is filled correctly
      //yield RegisterBabyLoadingState();
      try {
        await _registerBabyRepositoryImpl
            .checkDataEnteredCorrectly(_registerBabyModel);
          
      } catch (e) {
           yield  RegisterBabyErrorState(e.toString());
           yield RegisterBabyInitialState(_registerBabyModel);
        }
      //push data to dhis2 using api
      
    }
  }
}
