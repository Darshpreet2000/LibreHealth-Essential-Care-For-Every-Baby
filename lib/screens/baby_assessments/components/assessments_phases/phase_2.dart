import 'package:flutter/material.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/stage_2.dart';
import 'package:newborn_care/screens/baby_assessments/components/toggle_buttons/switch_yes_no.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Phase2 extends StatefulWidget {
  final Stage2 stage2;
  final AssessmentsBloc assessmentsBloc;
  final TextEditingController _wardNameTextController =
      new TextEditingController();
  final int color;
  Phase2(this.stage2, this.assessmentsBloc, this.color) {
    _wardNameTextController.text = stage2.ecebWardName;
  }
  @override
  _Phase2State createState() => _Phase2State();
}

class _Phase2State extends State<Phase2> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    widget.assessmentsBloc.close();
    super.dispose();
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
                  color: Color(widget.color),
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
                  color: Color(widget.color),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding:
                  const EdgeInsets.only(left: 0, top: 16, bottom: 8, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      AppLocalizations.of(context)!.assessmentsPerformed,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: checkBoxFormWidget(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: checkBoxFormWidget(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: checkBoxFormWidget(
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
                  ),
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
                    child: Center(child: WeightSlider(widget.stage2)),
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
                    child: Center(child: TemperatureSlider(widget.stage2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: checkBoxExaminations(),
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
                  switchYesNo(widget.stage2.ecebFastBreathing, (newValue) {
                    setState(() {
                      widget.stage2.ecebFastBreathing = newValue!;
                    });
                  }, context, widget.stage2.isCompleted),
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
                  switchYesNo(widget.stage2.ecebChestIndrawing, (newValue) {
                    setState(() {
                      widget.stage2.ecebChestIndrawing = newValue!;
                    });
                  }, context, widget.stage2.isCompleted),
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
                  switchYesNo(widget.stage2.ecebFeedingProperly, (newValue) {
                    setState(() {
                      widget.stage2.ecebFeedingProperly = newValue!;
                    });
                  }, context, widget.stage2.isCompleted),
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
                  switchYesNo(widget.stage2.ecebConvulsions, (newValue) {
                    setState(() {
                      widget.stage2.ecebConvulsions = newValue!;
                    });
                  }, context, widget.stage2.isCompleted),
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
                  switchYesNo(widget.stage2.ecebSevereJaundice, (newValue) {
                    setState(() {
                      widget.stage2.ecebSevereJaundice = newValue!;
                    });
                  }, context, widget.stage2.isCompleted),
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
              contentPadding: EdgeInsets.all(4),

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

  Widget checkBoxExaminations() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.systematicExaminationsPerformed,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.head,
                  widget.stage2.ecebExaminationHead,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationHead = newValue!;
                      });
                  },
                ),
              ),
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.genitals,
                  widget.stage2.ecebExaminationGenitalia,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationGenitalia = newValue!;
                      });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.eyes,
                  widget.stage2.ecebExaminationEyes,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationEyes = newValue!;
                      });
                  },
                ),
              ),
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.anus,
                  widget.stage2.ecebExaminationAnus,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationAnus = newValue!;
                      });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.earsnosethroat,
                  widget.stage2.ecebExaminationEarsNoseThroat,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationEarsNoseThroat = newValue!;
                      });
                  },
                ),
              ),
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.muscuoskeletal,
                  widget.stage2.ecebExaminationMuscoskeletal,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationMuscoskeletal = newValue!;
                      });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.chest,
                  widget.stage2.ecebExaminationChest,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationChest = newValue!;
                      });
                  },
                ),
              ),
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.neurological,
                  widget.stage2.ecebExaminationNeurology,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationNeurology = newValue!;
                      });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.cardiovascular,
                  widget.stage2.ecebExaminationCardiovascular,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationCardiovascular = newValue!;
                      });
                  },
                ),
              ),
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.skin,
                  widget.stage2.ecebExaminationSkin,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationSkin = newValue!;
                      });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.abdomen,
                  widget.stage2.ecebExaminationAbdomen,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationAbdomen = newValue!;
                      });
                  },
                ),
              ),
              Expanded(
                child: checkBoxFormWidget(
                  AppLocalizations.of(context)!.overall,
                  widget.stage2.ecebExaminationOverall,
                  (newValue) {
                    if (widget.stage2.isCompleted == false)
                      setState(() {
                        widget.stage2.ecebExaminationOverall = newValue!;
                      });
                  },
                ),
              ),
            ],
          )
        ],
      ),
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
      ),
    );
  }
}
