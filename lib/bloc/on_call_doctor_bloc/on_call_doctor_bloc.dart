import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newborn_care/models/on_call_doctor_model.dart';
import 'package:newborn_care/repository/on_call_doctor_repository.dart';

part 'on_call_doctor_event.dart';
part 'on_call_doctor_state.dart';

class OnCallDoctorBloc extends Bloc<OnCallDoctorEvent, OnCallDoctorState> {
  OnCallDoctorRepository onCallDoctorRepository;
  OnCallDoctorBloc(this.onCallDoctorRepository) : super(OnCallDoctorLoading());

  @override
  Stream<OnCallDoctorState> mapEventToState(
    OnCallDoctorEvent event,
  ) async* {
    if (event is FetchOnCallDoctors) {
      yield OnCallDoctorLoading();
      List<OnCallDoctorModel> list =
          await onCallDoctorRepository.getListOfOnCallDoctors();
      yield OnCallDoctorLoaded(list);
    }
  }
}
