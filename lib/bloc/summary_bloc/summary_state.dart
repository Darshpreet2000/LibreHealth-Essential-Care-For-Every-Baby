part of 'summary_bloc.dart';

abstract class SummaryState  {
  const SummaryState();

  int get admitted;

  int get discharged;
  int get danger;
}

class SummaryInitial extends SummaryState {
 final int admitted;
 final int discharged;
 final int danger;

  SummaryInitial(this.admitted, this.discharged, this.danger);
}