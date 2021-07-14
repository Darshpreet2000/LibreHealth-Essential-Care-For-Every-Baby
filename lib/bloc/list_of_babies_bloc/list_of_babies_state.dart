part of 'list_of_babies_bloc.dart';

abstract class ListOfBabiesState {
  const ListOfBabiesState();
}

class ListOfBabiesInitial extends ListOfBabiesState {}

class ListOfBabiesLoading extends ListOfBabiesState {}

class ListOfBabiesErrorState extends ListOfBabiesState {
  final String message;

  ListOfBabiesErrorState(this.message);
}

class ListOfBabiesLoaded extends ListOfBabiesState {
  final List<ChildModel> childListRecently, childListPastRegistered;

  ListOfBabiesLoaded(this.childListRecently, this.childListPastRegistered);
}
