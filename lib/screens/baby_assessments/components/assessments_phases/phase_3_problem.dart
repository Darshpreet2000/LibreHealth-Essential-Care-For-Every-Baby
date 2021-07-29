import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/stage_3_problem.dart';

class Phase3Problem extends StatefulWidget {
  final Stage3Problem stage3problem;
  final AssessmentsBloc assessmentsBloc;
  final int index;
  const Phase3Problem(this.stage3problem, this.assessmentsBloc, this.index);

  @override
  _Phase3ProblemState createState() => _Phase3ProblemState();
}

class _Phase3ProblemState extends State<Phase3Problem> {
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
              AppLocalizations.of(context)!.theBabyHasBeenClassifiedProblem,
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
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.prolongedSkinToSkin,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget.stage3problem
                      .ecebStage3ProblemUnder2000gProlongSkinToSkinCare,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage3problem.isCompleted == false) {
                        widget.stage3problem
                                .ecebStage3ProblemUnder2000gProlongSkinToSkinCare =
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
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.expressBreastMilk,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget.stage3problem
                      .ecebStage3ProblemPoorFeedingExpressBreastMilk,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage3problem.isCompleted == false) {
                        widget.stage3problem
                                .ecebStage3ProblemPoorFeedingExpressBreastMilk =
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
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.useAlternativeFeedingMethods,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget.stage3problem
                      .ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage3problem.isCompleted == false) {
                        widget.stage3problem
                                .ecebStage3ProblemPoorFeedingUseAlternativeFeedingMethod =
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
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.improveThermalCare,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget.stage3problem
                      .ecebStage3ProblemAbnormalTemperatureImproveThermalCare,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage3problem.isCompleted == false) {
                        widget.stage3problem
                                .ecebStage3ProblemAbnormalTemperatureImproveThermalCare =
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
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!.continuedInpatientCare,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: widget
                      .stage3problem.ecebStage3ProblemContinueInpatientCare,
                  onChanged: (newValue) {
                    setState(() {
                      if (widget.stage3problem.isCompleted == false) {
                        widget.stage3problem
                            .ecebStage3ProblemContinueInpatientCare = true;
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
                  if (widget.stage3problem.isCompleted == false) {
                    widget.assessmentsBloc
                        .add(AssessmentsEventCompleteStage3(widget.index));
                  }
                },
                child: Text(
                  widget.stage3problem.isCompleted == false
                      ? AppLocalizations.of(context)!.saveAssessments
                      : AppLocalizations.of(context)!.assessmentsSaved,
                  style: TextStyle(
                    color: widget.stage3problem.isCompleted == false
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
