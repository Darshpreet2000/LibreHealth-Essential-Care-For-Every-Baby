import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/summary_bloc/summary_bloc.dart';
import 'package:newborn_care/bloc/user_activity_bloc/user_activity_bloc.dart';
import 'package:newborn_care/screens/profile/components/list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileList extends StatelessWidget {
  final color = const Color(0xff82A0C8);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityBloc, UserActivityState>(
      builder: (context, state) {
        if (state is UserActivityLoaded ||
            state is UserActivityLoadedWithProgress)
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(16),
              child: Material(
                elevation: 35,
                child: Column(
                  children: [
                    listHeading(context),
                    BlocBuilder<SummaryBloc, SummaryState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            rowItem(AppLocalizations.of(context)!.admitted,
                                state.admitted.toString(), context),
                            rowItem(AppLocalizations.of(context)!.discharged,
                                state.discharged.toString(), context),
                            rowItem(AppLocalizations.of(context)!.highRisk,
                                state.danger.toString(), context),
                          ],
                        );
                      },
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.userActivityList.length,
                      itemBuilder: (context, index) {
                        return ListItem(
                          listHeading: state.userActivityList[index].title,
                          dateTime: state.userActivityList[index].dateTime,
                        );
                      },
                    ),
                    if (state is UserActivityLoadedWithProgress)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    else
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.blueAccent, width: 2.0))),
                          ),
                          onPressed: () {
                            BlocProvider.of<UserActivityBloc>(context)
                                .add(UserActivityLoadMore());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Load more",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ))
                  ],
                ),
              ));
        if (state is UserActivityError) {
          return Container();
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget rowItem(String title, String number, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(8),
      child: Material(
        elevation: 15,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title + ": ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                number,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listHeading(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0), child: activityAndSort(context));
  }

  Widget activityAndSort(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.activity,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchContainer(BuildContext context) {
    final color = const Color(0xff82A0C8);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.searchTheListOfBabies,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
