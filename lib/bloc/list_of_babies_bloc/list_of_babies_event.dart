part of 'list_of_babies_bloc.dart';

abstract class ListOfBabiesEvent {
  const ListOfBabiesEvent();
}

class ListOfBabiesAddChild extends ListOfBabiesEvent {
  final ChildModel childModel;
  final String key;
  ListOfBabiesAddChild(this.childModel, this.key);
}

class ListOfBabiesFetchData extends ListOfBabiesEvent {}
