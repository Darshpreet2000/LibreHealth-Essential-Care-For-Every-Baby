import 'package:flutter/material.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/stage_4.dart';
import 'package:newborn_care/screens/baby_assessments/components/toggle_buttons/switch_yes_no.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Phase4 extends StatefulWidget {
  final Stage4 stage4;
  final AssessmentsBloc assessmentsBloc;
  final int color;
  Phase4(this.stage4, this.assessmentsBloc, this.color);
  @override
  _Phase4State createState() => _Phase4State();
}

class _Phase4State extends State<Phase4> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
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
                  color: Color(widget.color),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.phase4,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.examinations,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.weightOfBabyInGrams,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: WeightSlider(widget.stage4)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!
                          .temperatureOfBabyInFarenheit,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: TemperatureSlider(widget.stage4)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.fastBreathing,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  switchYesNo(widget.stage4.ecebFastBreathing, (newValue) {
                    setState(() {
                      widget.stage4.ecebFastBreathing = newValue!;
                    });
                  }, context, widget.stage4.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.chestIndrawing,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  switchYesNo(widget.stage4.ecebChestIndrawing, (newValue) {
                    setState(() {
                      widget.stage4.ecebChestIndrawing = newValue!;
                    });
                  }, context, widget.stage4.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.convulsionsSigns,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  switchYesNo(widget.stage4.ecebConvulsions, (newValue) {
                    setState(() {
                      widget.stage4.ecebConvulsions = newValue!;
                    });
                  }, context, widget.stage4.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.isBabyFeedingProperly,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  switchYesNo(widget.stage4.ecebFeedingProperly, (newValue) {
                    setState(() {
                      widget.stage4.ecebFeedingProperly = newValue!;
                    });
                  }, context, widget.stage4.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.jaundiceSigns,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  switchYesNo(widget.stage4.ecebSevereJaundice, (newValue) {
                    setState(() {
                      widget.stage4.ecebSevereJaundice = newValue!;
                    });
                  }, context, widget.stage4.isCompleted),
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
                  if (widget.stage4.isCompleted == false &&
                      _formKey.currentState!.validate()) {
                    widget.assessmentsBloc
                        .add(AssessmentsEventCompleteStage4());
                  }
                },
                child: Text(
                  widget.stage4.isCompleted == false
                      ? AppLocalizations.of(context)!.saveAssessments
                      : AppLocalizations.of(context)!.assessmentsSaved,
                  style: TextStyle(
                    color: widget.stage4.isCompleted == false
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

class WeightSlider extends StatefulWidget {
  final Stage4 stage4;
  WeightSlider(this.stage4);

  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  int calculateNumber(int number) {
    int a = number % 100;

    if (a > 0) {
      return (number ~/ 100) * 100 + 100;
    }

    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
      child: SfSliderTheme(
        data: SfSliderThemeData(
          activeMinorTickColor: Colors.red,
          inactiveMinorTickColor: Colors.red[200],
        ),
        child: SfSlider(
          min: 1000.0,
          max: 4000.0,
          interval: 1000,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 5,
          tooltipShape: SfPaddleTooltipShape(),
          value: widget.stage4.ecebWeight,
          onChanged: (dynamic newValue) {
            if (widget.stage4.isCompleted == false)
              setState(() {
                double temp = newValue;
                int pass = temp.toInt();
                pass = calculateNumber(pass);
                widget.stage4.ecebWeight = pass.toDouble();
              });
          },
        ),
      ),
    );
  }
}

class TemperatureSlider extends StatefulWidget {
  final Stage4 stage4;
  TemperatureSlider(this.stage4);
  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
      child: SfSliderTheme(
        data: SfSliderThemeData(
          activeMinorTickColor: Colors.red,
          inactiveMinorTickColor: Colors.red[200],
        ),
        child: SfSlider(
          min: 94.0,
          max: 106.0,
          interval: 2,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          tooltipShape: SfPaddleTooltipShape(),
          value: widget.stage4.ecebAssessTemperature,
          onChanged: (dynamic newValue) {
            if (widget.stage4.isCompleted == false)
              setState(() {
                double temp = newValue;
                int pass = temp.toInt();
                widget.stage4.ecebAssessTemperature = pass.toDouble();
              });
          },
        ),
      ),
    );
  }
}
