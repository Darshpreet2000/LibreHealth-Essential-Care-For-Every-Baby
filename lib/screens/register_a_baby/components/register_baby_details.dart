import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/screens/register_a_baby/components/toggle_buttons/gender_button.dart';
import 'package:newborn_care/screens/register_a_baby/components/toggle_buttons/skin_color_changes_button.dart';
import 'package:newborn_care/screens/register_a_baby/components/toggle_buttons/traumas_during_birth_button.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RegisterBabyDetails extends StatefulWidget {
  final BabyDetailsModel _babyDetails;
  RegisterBabyDetails(this._babyDetails);

  @override
  _RegisterBabyDetailsState createState() => _RegisterBabyDetailsState();
}

class _RegisterBabyDetailsState extends State<RegisterBabyDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Baby's Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Gender",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
         GenderButton("Male", "Female", widget._babyDetails),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Birth Date and Time",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
            onPressed: () {
              DatePicker.showDateTimePicker(context,
                  showTitleActions: true,
                  minTime:
                      DateTime(DateTime.now().year, DateTime.now().month, 1),
                  maxTime: DateTime.now(),
                  onChanged: (date) {}, onConfirm: (date) {
                  setState(() {
                     widget._babyDetails.birthDateTime = date;
                  });
              }, locale: LocaleType.en);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget._babyDetails.birthDateTime.day.toString()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                          
                              border: Border.all(color: Colors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget._babyDetails.birthDateTime.month.toString()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            
                            child: Text(widget._babyDetails.birthDateTime.year.toString()),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget._babyDetails.birthDateTime.hour.toString()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget._babyDetails.birthDateTime.minute.toString()),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Weight of the baby in (grams)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Center(child: WeightSlider(widget._babyDetails)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Skin Color Changes in Newborn",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SkinColorChangesButton("Yes", "No", widget._babyDetails),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Traumas during Birth",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        TraumasDuringBirthButton("Yes", "No",
            widget._babyDetails),
      ]),
    );
  }
}

class WeightSlider extends StatefulWidget {
  final BabyDetailsModel _babyDetails;

  WeightSlider(this._babyDetails);

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
        value: widget._babyDetails.weight,
        onChanged: (dynamic newValue) {
          setState(() {
            double temp = newValue;
            int pass = temp.toInt();
            pass = calculateNumber(pass);
            widget._babyDetails.weight = pass.toDouble();
          });
        },
      ),
    );
  }
}
