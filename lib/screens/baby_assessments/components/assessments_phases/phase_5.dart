import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/stage_5.dart';

class Phase5 extends StatefulWidget {
  final Stage5 stage5;
  final AssessmentsBloc assessmentsBloc;

  const Phase5(this.stage5, this.assessmentsBloc);

  @override
  _Phase5State createState() => _Phase5State();
}

class _Phase5State extends State<Phase5> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.discharge,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
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
                    AppLocalizations.of(context)!
                        .ecebStage5NormalReassessBabyfordischarge,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget.stage5.ecebStage5NormalReassessBabyfordischarge,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage5.isCompleted == false) {
                        widget.stage5.ecebStage5NormalReassessBabyfordischarge =
                            true;
                      }
                    });
                  },
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
                    AppLocalizations.of(context)!
                        .ecebStage5NormalGiveparentsguidanceforhomecare,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget
                      .stage5.ecebStage5NormalGiveparentsguidanceforhomecare,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage5.isCompleted == false) {
                        widget.stage5
                                .ecebStage5NormalGiveparentsguidanceforhomecare =
                            true;
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
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
                  if (widget.stage5.isCompleted == false) {
                    widget.assessmentsBloc
                        .add(AssessmentsEventCompleteStage5());
                  }
                },
                child: Text(
                  widget.stage5.isCompleted == false
                      ? AppLocalizations.of(context)!.saveAssessments
                      : AppLocalizations.of(context)!.assessmentsSaved,
                  style: TextStyle(
                    color: widget.stage5.isCompleted == false
                        ? Colors.white
                        : Colors.white70,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
