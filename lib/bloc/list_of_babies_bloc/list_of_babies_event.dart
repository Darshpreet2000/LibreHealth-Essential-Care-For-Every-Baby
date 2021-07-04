part of 'list_of_babies_bloc.dart';

abstract class ListOfBabiesEvent {
  const ListOfBabiesEvent();
}

class ListOfBabiesAddChild extends ListOfBabiesEvent {
  final ChildModel childModel;

  ListOfBabiesAddChild(this.childModel);
}

class ListOfBabiesFetchData extends ListOfBabiesEvent {}
