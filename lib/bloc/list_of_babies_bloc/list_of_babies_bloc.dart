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
      Map<String, ChildModel> childListMap = new Map();
      try {
        List<ChildModel> childModel =
            await listOfBabiesRepository.fetchListOfBabies();
        //converting to map
        
        childModel.forEach((element) {
          childListMap[element.trackedEntityID] = element;
        });
        childListMap.values.toList().sort((a, b) {
          var adate = a.birthTime;
          var bdate = b.birthTime;
          return bdate.compareTo(adate);
        });
        hiveStorageRepository.storeListOfChild(childListMap);
      } catch (e) {
        childListMap = hiveStorageRepository.getListOfChild();
      }
      List<ChildModel> recentList = [], pastRegistered = [];
      childListMap.values.toList().forEach((element) {
        if ((DateTime.now()).difference(element.birthTime).inHours < 24) {
          recentList.add(element);
        } else {
          pastRegistered.add(element);
        }
      });
      yield ListOfBabiesLoaded(recentList, pastRegistered);
    }
    if (event is ListOfBabiesAddChild) {
      Map<String, ChildModel> childListMap  = hiveStorageRepository.getListOfChild();
      childListMap[event.key] = event.childModel;
      childListMap.values.toList().sort((a, b) {
        var adate = a.birthTime;
        var bdate = b.birthTime;
        return bdate.compareTo(adate);
      });
      hiveStorageRepository.storeListOfChild(childListMap);
      List<ChildModel> recentList = [], pastRegistered = [];
      childListMap.values.toList().forEach((element) {
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
