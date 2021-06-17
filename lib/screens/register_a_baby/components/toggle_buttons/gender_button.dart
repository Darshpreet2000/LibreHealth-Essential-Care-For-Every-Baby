import 'package:flutter/material.dart';
import 'package:newborn_care/models/register_baby_model.dart';

class GenderButton extends StatefulWidget {
  final String first, second;

  final BabyDetailsModel _babyDetailsModel;
  GenderButton(this.first, this.second, this._babyDetailsModel);

  @override
  _GenderButtonState createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blue, width: 2.5),
                  primary: widget._babyDetailsModel.gender != null &&
                          widget._babyDetailsModel.gender == true
                      ? Colors.blue
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
              onPressed: () {
                setState(() {
                  widget._babyDetailsModel.gender = true;
                });
              },
              child: Text(
                widget.first,
                style: TextStyle(
                  color: widget._babyDetailsModel.gender != null &&
                          widget._babyDetailsModel.gender == true
                      ? Colors.white
                      : Theme.of(context).textTheme.subtitle1!.color,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blue, width: 2.5),
                  primary: widget._babyDetailsModel.gender != null &&
                          widget._babyDetailsModel.gender == false
                      ? Colors.blue
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
              onPressed: () {
                setState(() {
                  widget._babyDetailsModel.gender = false;
                });
              },
              child: Text(
                widget.second,
                style: TextStyle(
                  color: widget._babyDetailsModel.gender!=null&&widget._babyDetailsModel.gender==false
                      ? Colors.white
                      : Theme.of(context).textTheme.subtitle1!.color,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
