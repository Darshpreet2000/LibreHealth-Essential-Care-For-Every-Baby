part of 'assessments_bloc.dart';

abstract class AssessmentsState {
  const AssessmentsState();

  get childModel => null;
}

class AssessmentsInitial extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsInitial(this.childModel);
}

class AssessmentsAdded extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsAdded(this.childModel);
}

class AssessmentsError extends AssessmentsState {
  final String message;

  AssessmentsError(this.message);
}

class AssessmentsLoading extends AssessmentsState {}
