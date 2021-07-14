part of 'list_of_babies_bloc.dart';

abstract class ListOfBabiesEvent {
  const ListOfBabiesEvent();
}

class ListOfBabiesFetchData extends ListOfBabiesEvent {}

class ListOfBabiesRefreshList extends ListOfBabiesEvent {}

class ListOfBabiesSearchList extends ListOfBabiesEvent {
  final String searchQuery;

  ListOfBabiesSearchList(this.searchQuery);
}

class ListOfBabiesSortList extends ListOfBabiesEvent {
  final SortListEnum sortListEnum;

  ListOfBabiesSortList(this.sortListEnum);
}
