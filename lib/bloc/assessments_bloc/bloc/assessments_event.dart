part of 'assessments_bloc.dart';

abstract class AssessmentsEvent extends Equatable {
  const AssessmentsEvent();

  @override
  List<Object> get props => [];
}

class AssessmentsEventAddStage1 extends AssessmentsEvent {
  AssessmentsEventAddStage1();
}
