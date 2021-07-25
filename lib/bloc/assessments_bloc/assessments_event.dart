part of 'assessments_bloc.dart';

abstract class AssessmentsEvent {
  const AssessmentsEvent();
}

class AssessmentsEventCompleteStage1 extends AssessmentsEvent {}

class AssessmentsEventFetchData extends AssessmentsEvent {}

class AssessmentsEventCompleteStage2 extends AssessmentsEvent {}

class AssessmentsEventCompleteStage3 extends AssessmentsEvent {}

class AssessmentsEventCompleteStage4 extends AssessmentsEvent {}

class DischargeButtonClick extends AssessmentsEvent {}
