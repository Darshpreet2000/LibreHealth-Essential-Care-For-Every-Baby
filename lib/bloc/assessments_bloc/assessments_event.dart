part of 'assessments_bloc.dart';

abstract class AssessmentsEvent extends Equatable {
  const AssessmentsEvent();

  @override
  List<Object> get props => [];
}

class AssessmentsEventCompleteStage1 extends AssessmentsEvent {}

class AssessmentsEventFetchData extends AssessmentsEvent {}

class AssessmentsEventCompleteStage2 extends AssessmentsEvent {}

class AssessmentsEventCompleteStage3 extends AssessmentsEvent {}
