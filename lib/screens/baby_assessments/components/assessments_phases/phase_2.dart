import 'package:flutter/material.dart';
import 'package:newborn_care/bloc/assessments_bloc/bloc/assessments_bloc.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/screens/baby_assessments/components/toggle_buttons/swtich_yes_no.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Phase2 extends StatefulWidget {
  final Stage2 stage2;
  final AssessmentsBloc assessmentsBloc;
  final TextEditingController _wardNameTextController =
      new TextEditingController();
  Phase2(this.stage2, this.assessmentsBloc) {
    _wardNameTextController.text = stage2.ecebWardName;
  }
  @override
  _Phase2State createState() => _Phase2State();
}

class _Phase2State extends State<Phase2> {
  List<bool?> toggleButtonsList = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    toggleButtonsList.addAll([
      widget.stage2.ecebFastBreathing,
      widget.stage2.ecebChestIndrawing,
      widget.stage2.ecebFeedingProperly,
      widget.stage2.ecebConvulsions,
      widget.stage2.ecebSevereJaundice,
    ]);
    super.initState();
  }

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
                  color: Colors.blue[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.phase2,
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
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .enterWardName;
                            }
                          },
                          readOnly: widget.stage2.isCompleted,
                          controller: widget._wardNameTextController,
                          onChanged: (String _value) {
                            widget.stage2.ecebWardName = _value;
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
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding:
                  const EdgeInsets.only(left: 0, top: 16, bottom: 8, right: 0),
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
                  checkBoxFormWidget(
                    AppLocalizations.of(context)!.eyeCareAdministered,
                    widget.stage2.ecebStage2PreventDiseaseEyeCare,
                    (newValue) {
                      if (widget.stage2.isCompleted == false)
                        setState(() {
                          widget.stage2.ecebStage2PreventDiseaseEyeCare =
                              newValue!;
                        });
                    },
                  ),
                  checkBoxFormWidget(
                    AppLocalizations.of(context)!.cordCareAdministered,
                    widget.stage2.ecebStage2PreventDiseaseCordCare,
                    (newValue) {
                      if (widget.stage2.isCompleted == false)
                        setState(() {
                          widget.stage2.ecebStage2PreventDiseaseCordCare =
                              newValue!;
                        });
                    },
                  ),
                  checkBoxFormWidget(
                    AppLocalizations.of(context)!.vitaminKAdministered,
                    widget.stage2.ecebStage2PreventDiseaseVitaminK,
                    (newValue) {
                      if (widget.stage2.isCompleted == false)
                        setState(() {
                          widget.stage2.ecebStage2PreventDiseaseVitaminK =
                              newValue!;
                        });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.examinations,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.weightOfBabyInGrams,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: WeightSlider(widget.stage2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!
                          .temperatureOfBabyInFarenheit,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: TemperatureSlider(widget.stage2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExaminationsCheckBoxList(widget.stage2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.fastBreathing,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SwtichYesNo(
                      AppLocalizations.of(context)!.yes,
                      AppLocalizations.of(context)!.no,
                      toggleButtonsList,
                      0,
                      widget.stage2.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.chestIndrawing,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SwtichYesNo(
                      AppLocalizations.of(context)!.yes,
                      AppLocalizations.of(context)!.no,
                      toggleButtonsList,
                      1,
                      widget.stage2.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.isBabyFeedingProperly,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SwtichYesNo(
                      AppLocalizations.of(context)!.yes,
                      AppLocalizations.of(context)!.no,
                      toggleButtonsList,
                      2,
                      widget.stage2.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.convulsionsSigns,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SwtichYesNo(
                      AppLocalizations.of(context)!.yes,
                      AppLocalizations.of(context)!.no,
                      toggleButtonsList,
                      3,
                      widget.stage2.isCompleted),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.jaundiceSigns,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SwtichYesNo(
                      AppLocalizations.of(context)!.yes,
                      AppLocalizations.of(context)!.no,
                      toggleButtonsList,
                      4,
                      widget.stage2.isCompleted),
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
                  if (widget.stage2.isCompleted == false &&
                      _formKey.currentState!.validate()) {
                    widget.stage2.ecebFastBreathing = toggleButtonsList[0];
                    widget.stage2.ecebChestIndrawing = toggleButtonsList[1];
                    widget.stage2.ecebFeedingProperly = toggleButtonsList[2];
                    widget.stage2.ecebConvulsions = toggleButtonsList[3];
                    widget.stage2.ecebSevereJaundice = toggleButtonsList[4];
                    widget.assessmentsBloc
                        .add(AssessmentsEventCompleteStage2());
                  }
                },
                child: Text(
                  widget.stage2.isCompleted == false
                      ? AppLocalizations.of(context)!.saveAssessments
                      : AppLocalizations.of(context)!.assessmentsSaved,
                  style: TextStyle(
                    color: widget.stage2.isCompleted == false
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

  Widget checkBoxFormWidget(String title, bool? value, Function onChange) {
    return FormField<bool?>(
      initialValue: value,
      builder: (FormFieldState<bool?> state) {
        return Column(
          children: [
            CheckboxListTile(
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.blue[700], fontWeight: FontWeight.bold),
              ),
              value: value,
              onChanged: (newVal) {
                if (widget.stage2.isCompleted == false) {
                  onChange(newVal);
                  state.didChange(newVal);
                }
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            state.errorText == null
                ? Container()
                : Text(state.errorText!, style: TextStyle(color: Colors.red)),
          ],
        );
      },
      validator: (val) {
        if (val == false)
          return AppLocalizations.of(context)!.completeAssessments;
      },
    );
  }
}

class ExaminationsCheckBoxList extends StatefulWidget {
  final Stage2 stage2;
  ExaminationsCheckBoxList(this.stage2);
  @override
  _ExaminationsCheckBoxListState createState() =>
      _ExaminationsCheckBoxListState();
}

class _ExaminationsCheckBoxListState extends State<ExaminationsCheckBoxList> {
  List<List<bool>> checkBoxListState = [];

  @override
  void initState() {
    var list;
    for (int i = 0; i < 6; i++) {
      if (widget.stage2.ecebStage2AssessExam == false)
        list = [false, false];
      else
        list = [true, true];

      checkBoxListState.add(list);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var checkBoxListTitles = [
      [
        AppLocalizations.of(context)!.head,
        AppLocalizations.of(context)!.genitals
      ],
      [AppLocalizations.of(context)!.eyes, AppLocalizations.of(context)!.anus],
      [
        AppLocalizations.of(context)!.earsnosethroat,
        AppLocalizations.of(context)!.muscuoskeletal
      ],
      [
        AppLocalizations.of(context)!.chest,
        AppLocalizations.of(context)!.neurological
      ],
      [
        AppLocalizations.of(context)!.cardiovascular,
        AppLocalizations.of(context)!.skin
      ],
      [
        AppLocalizations.of(context)!.abdomen,
        AppLocalizations.of(context)!.overall
      ]
    ];
    return FormField<bool?>(
      initialValue: widget.stage2.ecebStage2AssessExam,
      builder: (FormFieldState<bool?> state) {
        return Container(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.systematicExaminationsPerformed,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: checkBoxListTitles.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.all(4),
                          title: Text(
                            checkBoxListTitles[index][0],
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold),
                          ),
                          value: checkBoxListState[index][0],
                          onChanged: (newValue) {
                            if (widget.stage2.isCompleted == false)
                              setState(() {
                                checkBoxListState[index][0] =
                                    !checkBoxListState[index][0];
                              });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.all(4),
                          title: Text(
                            checkBoxListTitles[index][1],
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold),
                          ),
                          value: checkBoxListState[index][1],
                          onChanged: (newValue) {
                            if (widget.stage2.isCompleted == false)
                              setState(() {
                                checkBoxListState[index][1] =
                                    !checkBoxListState[index][1];
                              });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),
                    ],
                  );
                },
              ),
              state.errorText == null
                  ? Container()
                  : Text(state.errorText!, style: TextStyle(color: Colors.red)),
            ],
          ),
        );
      },
      validator: (val) {
        if (val == false) {
          for (int i = 0; i < checkBoxListState.length; i++) {
            for (int j = 0; j < checkBoxListState[i].length; j++) {
              if (checkBoxListState[i][j] == false)
                return AppLocalizations.of(context)!.completeAssessments;
            }
          }
          widget.stage2.ecebStage2AssessExam = true;
        }
      },
    );
  }
}

class WeightSlider extends StatefulWidget {
  final Stage2 stage2;
  WeightSlider(this.stage2);

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
    return SfSliderTheme(
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
        value: widget.stage2.ecebWeight,
        onChanged: (dynamic newValue) {
          if (widget.stage2.isCompleted == false)
            setState(() {
              double temp = newValue;
              int pass = temp.toInt();
              pass = calculateNumber(pass);
              widget.stage2.ecebWeight = pass.toDouble();
            });
        },
      ),
    );
  }
}

class TemperatureSlider extends StatefulWidget {
  final Stage2 stage2;
  TemperatureSlider(this.stage2);
  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
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
        value: widget.stage2.ecebAssessTemperature,
        onChanged: (dynamic newValue) {
          if (widget.stage2.isCompleted == false)
            setState(() {
              double temp = newValue;
              int pass = temp.toInt();
              widget.stage2.ecebAssessTemperature = pass.toDouble();
            });
        },
      ),
    );
  }
}
