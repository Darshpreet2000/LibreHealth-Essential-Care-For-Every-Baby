import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/repository/assessments_repository.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/notification_repository.dart';
import 'package:newborn_care/screens/baby_assessments/baby_assessments.dart';

class ListItem extends StatelessWidget {
  final ChildModel childModel;
  final bool allowNavigate;
  ListItem(this.childModel, this.allowNavigate);
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now().difference(childModel.birthTime).inHours >= 2
        ? "${AppLocalizations.of(context)!.hoursFromBirth(DateTime.now().difference(childModel.birthTime).inHours)}"
        : "${AppLocalizations.of(context)!.minutesFromBirth(DateTime.now().difference(childModel.birthTime).inMinutes)}";
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      color: Color(childModel.darkColor),
      child: Material(
        elevation: 10,
        color: new Color(childModel.darkColor),
        child: InkWell(
          onTap: () {
            if (allowNavigate)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BabyAssessments(
                          childModel,
                          AssessmentsBloc(
                              RepositoryProvider.of<NotificationRepository>(
                                  context),
                              RepositoryProvider.of<AssessmentsRepository>(
                                  context),
                              childModel,
                              RepositoryProvider.of<HiveStorageRepository>(
                                  context)))));
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 8, 16, 16),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(childModel.color),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(time,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: new TextSpan(
                                  // Note: Styles for TextSpans must be explicitly defined.
                                  // Child text spans will inherit styles from parent
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: AppLocalizations.of(context)!
                                            .babyOf(childModel.parent),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: new TextSpan(
                                  // Note: Styles for TextSpans must be explicitly defined.
                                  // Child text spans will inherit styles from parent
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text:
                                            "${AppLocalizations.of(context)!.location}: ",
                                        style: new TextStyle()),
                                    new TextSpan(
                                        text: childModel.ward,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 24,
                                  ),
                                  Text(
                                      childModel.gender == 1
                                          ? AppLocalizations.of(context)!.male
                                          : AppLocalizations.of(context)!
                                              .female,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color: Theme.of(context).iconTheme.color,
                                size: 30,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
