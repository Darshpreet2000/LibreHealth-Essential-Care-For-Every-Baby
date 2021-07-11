import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Phase1 extends StatefulWidget {
  const Phase1({Key? key}) : super(key: key);

  @override
  _Phase1State createState() => _Phase1State();
}

class _Phase1State extends State<Phase1> {
  bool? checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.phase1,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    AppLocalizations.of(context)!.currentLocation,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        onChanged: (String _value) {},
                        decoration: new InputDecoration(
                          isDense: true, // Added this
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                              borderSide: new BorderSide(color: Colors.grey)),
                          hintText: AppLocalizations.of(context)!.wardsName,
                          labelText: AppLocalizations.of(context)!.wardsName,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.assessmentsPerformed,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.skinToSkinCareGiven,
                    style: TextStyle(
                        color: Colors.blue[700], fontWeight: FontWeight.bold),
                  ),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.breathingMonitored,
                    style: TextStyle(
                        color: Colors.blue[700], fontWeight: FontWeight.bold),
                  ),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.breastFeedingInitiated,
                    style: TextStyle(
                        color: Colors.blue[700], fontWeight: FontWeight.bold),
                  ),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blue, width: 2.5),
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
              onPressed: () {
                setState(() {});
              },
              child: Text(
                AppLocalizations.of(context)!.saveAssessments,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
