part of 'assessments_bloc.dart';

abstract class AssessmentsState extends Equatable {
  const AssessmentsState();

  ChildModel get childModel;
}

class AssessmentsInitial extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsInitial(this.childModel);
  @override
  List<Object?> get props => [childModel];
}

class AssessmentsAdded extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsAdded(this.childModel);

  @override
  List<Object?> get props => [childModel];
}

class AssessmentsError extends AssessmentsState {
  final String message;

  AssessmentsError(this.message);

  @override
  List<Object?> get props => [];

  @override
  ChildModel get childModel => throw UnimplementedError();
}

class AssessmentsLoading extends AssessmentsState {
  final ChildModel childModel;

  AssessmentsLoading(this.childModel);

  @override
  List<Object?> get props => [];
}
