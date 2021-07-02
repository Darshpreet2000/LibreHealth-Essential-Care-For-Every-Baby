import 'package:flutter/material.dart';
import 'package:newborn_care/screens/baby_assessments/components/toggle_buttons/swtich_yes_no.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Phase4 extends StatefulWidget {
  const Phase4({Key? key}) : super(key: key);

  @override
  _Phase4State createState() => _Phase4State();
}

class _Phase4State extends State<Phase4> {
  bool checkedValue = false;
  List<bool> fastBreathing = [];
  List<bool> chestIndrawing = [];
  List<bool> isFeeding = [];
  List<bool> convulsions = [];
  List<bool> jaundice = [];
  @override
  void initState() {
    for (int i = 0; i < 2; i++) {
      fastBreathing.addAll([false, false]);
      chestIndrawing.addAll([false, false]);
      isFeeding.addAll([false, false]);
      convulsions.addAll([false, false]);
      jaundice.addAll([false, false]);
    }
    super.initState();
  }

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
                child: Text(
                    AppLocalizations.of(context)!.checkupAfter90Minutes,
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
                          labelText:AppLocalizations.of(context)!.wardsName,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                   AppLocalizations.of(context)!.weightOfBabyInGrams,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: WeightSlider()),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.temperatureOfBabyInFarenheit,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: TemperatureSlider()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.fastBreathing,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SwtichYesNo(AppLocalizations.of(context)!.yes,AppLocalizations.of(context)!.no, fastBreathing),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.chestIndrawing,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SwtichYesNo(AppLocalizations.of(context)!.yes,AppLocalizations.of(context)!.no, chestIndrawing),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.isBabyFeedingProperly,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SwtichYesNo(AppLocalizations.of(context)!.yes, AppLocalizations.of(context)!.no, isFeeding),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.convulsionsSigns,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SwtichYesNo(AppLocalizations.of(context)!.yes, AppLocalizations.of(context)!.no, convulsions),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.jaundiceSigns,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SwtichYesNo(AppLocalizations.of(context)!.yes,AppLocalizations.of(context)!.no, convulsions),
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
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.saveAssessments,
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

class ExaminationsCheckBoxList extends StatefulWidget {
  const ExaminationsCheckBoxList({Key? key}) : super(key: key);

  @override
  _ExaminationsCheckBoxListState createState() =>
      _ExaminationsCheckBoxListState();
}

class _ExaminationsCheckBoxListState extends State<ExaminationsCheckBoxList> {
  
  List<List<bool>> checkBoxListState = [];

  @override
  void initState() {
    for (int i = 0; i < 6; i++) {
      var list = [false, false];
      checkBoxListState.add(list);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var checkBoxListTitles = [
    [AppLocalizations.of(context)!.head, AppLocalizations.of(context)!.genitals],
    [AppLocalizations.of(context)!.eyes, AppLocalizations.of(context)!.anus],
    [AppLocalizations.of(context)!.earsnosethroat, AppLocalizations.of(context)!.muscuoskeletal],
    [AppLocalizations.of(context)!.chest,AppLocalizations.of(context)!.neurological],
    [AppLocalizations.of(context)!.cardiovascular, AppLocalizations.of(context)!.skin],
    [AppLocalizations.of(context)!.abdomen, AppLocalizations.of(context)!.overall]
  ];
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.systematicExaminationsPerformed,
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
        ],
      ),
    );
  }
}
class WeightSlider extends StatefulWidget {
  WeightSlider();

  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  double weight = 1000;
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
        value: weight,
        onChanged: (dynamic newValue) {
          setState(() {
            double temp = newValue;
            int pass = temp.toInt();
            pass = calculateNumber(pass);
            weight = pass.toDouble();
          });
        },
      ),
    );
  }
}

class TemperatureSlider extends StatefulWidget {
  const TemperatureSlider({Key? key}) : super(key: key);

  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  double weight = 94;

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
        value: weight,
        onChanged: (dynamic newValue) {
          setState(() {
            double temp = newValue;
            int pass = temp.toInt();
            weight = pass.toDouble();
          });
        },
      ),
    );
  }
}
