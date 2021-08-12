part of 'summary_bloc.dart';

abstract class SummaryEvent {
  const SummaryEvent();
}

class FetchSummaryOf24Hours extends SummaryEvent {}
