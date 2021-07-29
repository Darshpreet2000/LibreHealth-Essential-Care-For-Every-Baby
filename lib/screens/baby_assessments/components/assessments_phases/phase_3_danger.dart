import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/stage_3_danger.dart';

class Phase3Danger extends StatefulWidget {
  final Stage3Danger stage3danger;
  final AssessmentsBloc assessmentsBloc;
  final int index;
  const Phase3Danger(this.stage3danger, this.assessmentsBloc, this.index);

  @override
  _Phase3DangerState createState() => _Phase3DangerState();
}

class _Phase3DangerState extends State<Phase3Danger> {
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
              AppLocalizations.of(context)!.theBabyHasBeenClassifiedDanger,
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
                    color: Colors.red[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.gaveAntibiotics,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget.stage3danger.ecebStage3GiveAntibiotics,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage3danger.isCompleted == false) {
                        widget.stage3danger.ecebStage3GiveAntibiotics = true;
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
                    color: Colors.red[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.soughAdvancedCare,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget.stage3danger.ecebStage3SeekAdvancedCare,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage3danger.isCompleted == false) {
                        widget.stage3danger.ecebStage3SeekAdvancedCare = true;
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
                  if (widget.stage3danger.isCompleted == false) {
                    widget.assessmentsBloc
                        .add(AssessmentsEventCompleteStage3(widget.index));
                  }
                },
                child: Text(
                  widget.stage3danger.isCompleted == false
                      ? AppLocalizations.of(context)!.saveAssessments
                      : AppLocalizations.of(context)!.assessmentsSaved,
                  style: TextStyle(
                    color: widget.stage3danger.isCompleted == false
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
