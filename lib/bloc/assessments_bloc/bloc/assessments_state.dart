part of 'assessments_bloc.dart';

abstract class AssessmentsState extends Equatable {
  const AssessmentsState();

  @override
  List<Object> get props => [];
}

class AssessmentsInitial extends AssessmentsState {
  final List<dynamic> assessmentsModel;

  AssessmentsInitial(this.assessmentsModel);
}

class AssessmentsError extends AssessmentsState {
  final String message;

  AssessmentsError(this.message);
}
