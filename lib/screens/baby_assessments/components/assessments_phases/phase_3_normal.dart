import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Phase3Normal extends StatelessWidget {
  const Phase3Normal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.theBabyHasBeenClassifiedNormal,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)!.followingInterventionsToBeTaken,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.maintainNormalTemperature,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.supportBreastFeeding,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(AppLocalizations.of(context)!.adviseAboutBreastFeedingProblems,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.immunize,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
