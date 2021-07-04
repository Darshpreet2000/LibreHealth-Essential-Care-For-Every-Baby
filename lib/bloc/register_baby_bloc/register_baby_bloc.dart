import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/list_of_babies_bloc/list_of_babies_bloc.dart';
import 'package:newborn_care/bloc/refresh_bloc/refresh_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/repository/register_baby_repository.dart';
import 'package:uuid/uuid.dart';

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
        //push data to dhis2 using api
        String key = Uuid().v1();
        await _registerBabyRepositoryImpl.registerBabyDetails(
            _registerBabyModel, key);
        _registerBabyModel.children.forEach((element) {
          ChildModel child = new ChildModel(
              _registerBabyModel.motherName,
              _registerBabyModel.wardName,
              element.gender! ? 1 : 0,
              Colors.blue[100]!.value,
              Colors.white.value,
              element.birthDateTime,
              "",
              key);
          child.assessmentsList.add(Stage1());
          BlocProvider.of<ListOfBabiesBloc>(event.context)
              .add(ListOfBabiesAddChild(child));
        });

        BlocProvider.of<RefreshBloc>(event.context).add(RefreshEventStart());
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
