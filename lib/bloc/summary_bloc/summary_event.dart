part of 'summary_bloc.dart';

abstract class SummaryEvent extends Equatable {
  const SummaryEvent();

  @override
  List<Object> get props => [];
}
class FetchSummaryOf24Hours extends SummaryEvent{
  
}