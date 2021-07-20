part of 'on_call_doctor_bloc.dart';

abstract class OnCallDoctorEvent extends Equatable {
  const OnCallDoctorEvent();

  @override
  List<Object> get props => [];
}
class FetchOnCallDoctors extends OnCallDoctorEvent{}