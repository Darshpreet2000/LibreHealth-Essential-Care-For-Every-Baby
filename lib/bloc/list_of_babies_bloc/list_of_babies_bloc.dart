import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/sort_list_enum.dart';
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
  String searchQuery = "";
  @override
  Stream<ListOfBabiesState> mapEventToState(
    ListOfBabiesEvent event,
  ) async* {
    yield ListOfBabiesLoading();
    if (event is ListOfBabiesFetchData) {
      try {
        childListMap = await listOfBabiesRepository.fetchListOfBabies();
        //store the list
        await hiveStorageRepository.storeListOfChild(childListMap);
      } catch (e) {
        yield ListOfBabiesErrorState(e.toString());
        childListMap = hiveStorageRepository.getListOfAllChild();
      }
      //sort and seperate lists
      List<ChildModel> recentList = [], pastRegistered = [];
      listOfBabiesRepository.seperateRecentAndPastRegistered(
          recentList, pastRegistered, childListMap);
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    } else if (event is ListOfBabiesRefreshList) {
      //refresh list after registering a child/after doing assessments
      childListMap = hiveStorageRepository.getListOfAllChild();
      //sort and seperate lists
      List<ChildModel> recentList = [], pastRegistered = [];
      listOfBabiesRepository.seperateRecentAndPastRegistered(
          recentList, pastRegistered, childListMap);
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    } else if (event is ListOfBabiesSearchList) {
      //sort and seperate lists
      searchQuery = event.searchQuery;
      List<ChildModel> recentList = [], pastRegistered = [];
      listOfBabiesRepository.searchQuery(
          searchQuery, recentList, pastRegistered, childListMap);
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    } else if (event is ListOfBabiesSortList) {
      //sort and seperate lists
      List<ChildModel> recentList = [], pastRegistered = [];
      listOfBabiesRepository.saveSortBy(event.sortListEnum);
      if (searchQuery.isEmpty)
        listOfBabiesRepository.seperateRecentAndPastRegistered(
            recentList, pastRegistered, childListMap);
      else
        listOfBabiesRepository.searchQuery(
            searchQuery, recentList, pastRegistered, childListMap);
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    }
  }
}
