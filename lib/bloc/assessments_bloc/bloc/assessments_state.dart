part of 'assessments_bloc.dart';

abstract class AssessmentsState {
  const AssessmentsState();
}

class AssessmentsInitial extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsInitial(this.childModel);
}

class AssessmentsError extends AssessmentsState {
  final String message;

  AssessmentsError(this.message);
}

class AssessmentsLoading extends AssessmentsState {}
