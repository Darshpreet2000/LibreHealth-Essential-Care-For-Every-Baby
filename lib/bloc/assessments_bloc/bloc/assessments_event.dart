part of 'assessments_bloc.dart';

abstract class AssessmentsEvent extends Equatable {
  const AssessmentsEvent();

  @override
  List<Object> get props => [];
}

class AssessmentsEventAddStage1 extends AssessmentsEvent {
  final Phase1 phase1;

  AssessmentsEventAddStage1(this.phase1);
}
