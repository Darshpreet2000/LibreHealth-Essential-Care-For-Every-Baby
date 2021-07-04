part of 'assessments_bloc.dart';

abstract class AssessmentsState extends Equatable {
  const AssessmentsState();

  @override
  List<Object> get props => [];
}

class AssessmentsInitial extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsInitial(this.childModel);
}

class AssessmentsError extends AssessmentsState {
  final String message;

  AssessmentsError(this.message);
}
