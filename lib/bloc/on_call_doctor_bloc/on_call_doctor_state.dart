part of 'on_call_doctor_bloc.dart';

abstract class OnCallDoctorState {
  const OnCallDoctorState();
}

class OnCallDoctorLoading extends OnCallDoctorState {}

class OnCallDoctorLoaded extends OnCallDoctorState {
  final List<OnCallDoctorModel> onCallDoctorsList;

  OnCallDoctorLoaded(this.onCallDoctorsList);
}
