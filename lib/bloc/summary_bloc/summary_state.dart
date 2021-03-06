part of 'summary_bloc.dart';

abstract class SummaryState extends Equatable {
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

  @override
  List<Object?> get props => [admitted, discharged, danger];
}
