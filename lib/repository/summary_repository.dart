import 'package:flutter/cupertino.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';

class SummaryRepository {
  BuildContext context;
  HiveStorageRepository hiveStorageRepository;

  SummaryRepository(this.hiveStorageRepository, this.context);

  Future fetchSummaryOf24Hours() async {
    int admitted = 0, complete = 0, danger = 0;
    List<ChildModel> childList = hiveStorageRepository.getListOfAllChild();
    childList.forEach((element) {
      admitted++;
      if (element.isCompleted) complete++;
      if (element.classification == AppLocalizations.of(context)!.danger) {
        danger++;
      }
    });
    return [admitted, complete, danger];
  }
}
