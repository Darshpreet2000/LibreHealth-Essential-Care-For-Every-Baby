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

  @override
  Stream<ListOfBabiesState> mapEventToState(
    ListOfBabiesEvent event,
  ) async* {
    yield ListOfBabiesLoading();
    if (event is ListOfBabiesFetchData) {
      List<ChildModel> childListMap = [];
      try {
        childListMap = await listOfBabiesRepository.fetchListOfBabies();
        //converting to map
        hiveStorageRepository.storeListOfChild(childListMap);
        childListMap.sort((a, b) => b.birthTime.compareTo(a.birthTime));
        print(childListMap);
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
      List<ChildModel> childListMap = hiveStorageRepository.getListOfAllChild();
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
