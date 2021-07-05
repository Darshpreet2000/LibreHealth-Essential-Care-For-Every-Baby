import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/list_of_babies_repository.dart';

part 'list_of_babies_event.dart';
part 'list_of_babies_state.dart';

class ListOfBabiesBloc extends Bloc<ListOfBabiesEvent, ListOfBabiesState> {
  HiveStorageRepository hiveStorageRepository;
  ListOfBabiesRepository listOfBabiesRepository;
  ListOfBabiesBloc(this.listOfBabiesRepository, this.hiveStorageRepository)
      : super(ListOfBabiesLoading());

  List<ChildModel> childListMap = [];
  @override
  Stream<ListOfBabiesState> mapEventToState(
    ListOfBabiesEvent event,
  ) async* {
    yield ListOfBabiesLoading();
    if (event is ListOfBabiesFetchData) {
      try {
        childListMap = await listOfBabiesRepository.fetchListOfBabies();
        //store the list
        childListMap.sort((a, b) => b.birthTime.compareTo(a.birthTime));
        hiveStorageRepository.storeListOfChild(childListMap);
      } catch (e) {
        childListMap = hiveStorageRepository.getListOfAllChild();
      }
      List<ChildModel> recentList = [], pastRegistered = [];
      childListMap.forEach((element) {
        if ((DateTime.now()).difference(element.birthTime).inHours < 24) {
          recentList.add(element);
        } else {
          pastRegistered.add(element);
        }
      });
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    }
    if (event is ListOfBabiesAddChild) {
      hiveStorageRepository.storeSingleChild(event.childModel);
      childListMap.add(event.childModel);
      childListMap.sort((a, b) => b.birthTime.compareTo(a.birthTime));
      List<ChildModel> recentList = [], pastRegistered = [];
      childListMap.forEach((element) {
        if ((DateTime.now()).difference(element.birthTime).inHours < 24) {
          recentList.add(element);
        } else {
          pastRegistered.add(element);
        }
      });
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    }
  }
}
