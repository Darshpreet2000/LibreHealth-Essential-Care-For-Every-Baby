part of 'assessments_bloc.dart';

abstract class AssessmentsState extends Equatable {
  const AssessmentsState();

  ChildModel get childModel;

  @override
  List<Object> get props => [];
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

  @override
  ChildModel get childModel => throw UnimplementedError();
}

class AssessmentsLoading extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsLoading(this.childModel);
}
