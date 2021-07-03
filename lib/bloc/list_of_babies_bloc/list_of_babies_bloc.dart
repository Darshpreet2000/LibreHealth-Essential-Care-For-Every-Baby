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

  List<ChildModel> childList = [];

  @override
  Stream<ListOfBabiesState> mapEventToState(
    ListOfBabiesEvent event,
  ) async* {
    yield ListOfBabiesLoading();
    if (event is ListOfBabiesFetchData) {
      try {
        childList = await listOfBabiesRepository.fetchListOfBabies();
        childList.sort((a, b) {
          var adate = a.birthTime;
          var bdate = b.birthTime;
          return bdate.compareTo(adate);
        });
        hiveStorageRepository.storeListOfChild(childList);
      } catch (e) {
        childList = hiveStorageRepository.getListOfChild();
      }
      List<ChildModel> recentList = [], pastRegistered = [];
      childList.forEach((element) {
        if ((DateTime.now()).difference(element.birthTime).inHours < 24) {
          recentList.add(element);
        } else {
          pastRegistered.add(element);
        }
      });
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    }
    if (event is ListOfBabiesAddChild) {
      childList.add(event.childModel);
      childList.sort((a, b) {
        var adate = a.birthTime;
        var bdate = b.birthTime;
        return bdate.compareTo(adate);
      });
      hiveStorageRepository.storeListOfChild(childList);
      List<ChildModel> recentList = [], pastRegistered = [];
      childList.forEach((element) {
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
