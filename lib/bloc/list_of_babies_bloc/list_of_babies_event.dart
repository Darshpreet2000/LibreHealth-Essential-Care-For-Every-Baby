part of 'list_of_babies_bloc.dart';

abstract class ListOfBabiesEvent {
  const ListOfBabiesEvent();
}

class ListOfBabiesFetchData extends ListOfBabiesEvent {}

class ListOfBabiesRefreshList extends ListOfBabiesEvent {}
