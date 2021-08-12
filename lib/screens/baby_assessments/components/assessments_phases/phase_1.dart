import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/stage_1.dart';

class Phase1 extends StatefulWidget {
  final Stage1 stage1;
  final AssessmentsBloc assessmentsBloc;
  final TextEditingController _wardNameTextController =
      new TextEditingController();
  final int color;
  Phase1(this.stage1, this.assessmentsBloc, this.color) {
    _wardNameTextController.text = stage1.ecebWardName;
  }
  @override
  _Phase1State createState() => _Phase1State();
}

class _Phase1State extends State<Phase1> {
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
                color: new Color(widget.color),
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
                        readOnly: widget.stage1.isCompleted,
                        controller: widget._wardNameTextController,
                        onChanged: (String _value) {
                          widget.stage1.ecebWardName = _value;
                        },
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
                color: new Color(widget.color),
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
                  value: widget.stage1.ecebStage1SkinToSkinCare,
                  onChanged: (newValue) {
                    if (widget.stage1.isCompleted == false)
                      setState(() {
                        widget.stage1.ecebStage1SkinToSkinCare = newValue;
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
                  value: widget.stage1.ecebStage1MonitorBreathing,
                  onChanged: (newValue) {
                    if (widget.stage1.isCompleted == false)
                      setState(() {
                        widget.stage1.ecebStage1MonitorBreathing = newValue;
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
                  value: widget.stage1.ecebStage1InitiateBreastfeeding,
                  onChanged: (newValue) {
                    if (widget.stage1.isCompleted == false)
                      setState(() {
                        widget.stage1.ecebStage1InitiateBreastfeeding =
                            newValue;
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
                if (widget.stage1.isCompleted == false)
                  setState(() {
                    widget.assessmentsBloc
                        .add(AssessmentsEventCompleteStage1());
                  });
              },
              child: Text(
                widget.stage1.isCompleted == false
                    ? AppLocalizations.of(context)!.saveAssessments
                    : AppLocalizations.of(context)!.assessmentsSaved,
                style: TextStyle(
                  color: widget.stage1.isCompleted == false
                      ? Colors.white
                      : Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
