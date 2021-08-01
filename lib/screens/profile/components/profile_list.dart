import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/user_activity_bloc/user_activity_bloc.dart';
import 'package:newborn_care/screens/profile/components/list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileList extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  final enableDisableScroll;

  ProfileList(this.enableDisableScroll);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityBloc, UserActivityState>(
      builder: (context, state) {
        if (state is UserActivityLoaded)
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(16),
              child: Material(
                elevation: 35,
                child: Column(
                  children: [
                    listHeading(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        rowItem(AppLocalizations.of(context)!.registeredBabies,
                            "14", context),
                        rowItem(AppLocalizations.of(context)!.dischargedBabies,
                            "10", context),
                        rowItem(AppLocalizations.of(context)!.dischargedBabies,
                            "8", context),
                      ],
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
                    )
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
