import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/notification_model.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/repository/refresh_repository.dart';
import 'package:newborn_care/screens/baby_assessments/baby_assessments.dart';

import '../../../main.dart';

class ListItemRiskMonitoringAlert extends StatelessWidget {
  final NotificationModel? notificationModel;
  ListItemRiskMonitoringAlert(this.notificationModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return BabyAssessments(
              notificationModel!.childModel,
              AssessmentsBloc(
                  NotificationRepository(context),
                  AssessmentsRepository(
                    context,
                    lock,
                    RepositoryProvider.of<HiveStorageRepository>(context),
                    RepositoryProvider.of<RefreshRepository>(context),
                    RepositoryProvider.of<NotificationRepository>(context),
                  ),
                  notificationModel!.childModel,
                  RepositoryProvider.of<HiveStorageRepository>(context)));
        }));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color:
                                Color(notificationModel!.childModel.darkColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          AppLocalizations.of(context)!
                              .babyOf(notificationModel!.childModel.parent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          "${AppLocalizations.of(context)!.location}: ${notificationModel!.childModel.ward}",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                             DateFormat.yMd().add_jm().format(notificationModel!.childModel.birthTime)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        notificationModel!.messageText,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
