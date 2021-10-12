import 'package:flutter/material.dart';
import 'package:newborn_care/models/register_baby_model.dart';

class TraumasDuringBirthButton extends StatefulWidget {
  final String first, second;
  final BabyDetailsModel _babyDetailsModel;
  final TextEditingController traumasTextController =
      new TextEditingController();
  TraumasDuringBirthButton(this.first, this.second, this._babyDetailsModel);

  @override
  _TraumasDuringBirthButtonState createState() =>
      _TraumasDuringBirthButtonState();
}

class _TraumasDuringBirthButtonState extends State<TraumasDuringBirthButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.red[600]!, width: 2.5),
                      primary:
                          widget._babyDetailsModel.traumasDuringBirth != null &&
                                  widget._babyDetailsModel.traumasDuringBirth ==
                                      true
                              ? Colors.red[600]
                              : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._babyDetailsModel.traumasDuringBirth = true;
                    });
                  },
                  child: Text(
                    widget.first,
                    style: TextStyle(
                      color:
                          widget._babyDetailsModel.traumasDuringBirth != null &&
                                  widget._babyDetailsModel.traumasDuringBirth ==
                                      true
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
                      side: BorderSide(color: Colors.green, width: 2.5),
                      primary:
                          widget._babyDetailsModel.traumasDuringBirth != null &&
                                  widget._babyDetailsModel.traumasDuringBirth ==
                                      false
                              ? Colors.green
                              : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._babyDetailsModel.traumasDuringBirth = false;
                    });
                  },
                  child: Text(
                    widget.second,
                    style: TextStyle(
                      color:
                          widget._babyDetailsModel.traumasDuringBirth != null &&
                                  widget._babyDetailsModel.traumasDuringBirth ==
                                      false
                              ? Colors.white
                              : Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        widget._babyDetailsModel.traumasDuringBirth != null &&
                widget._babyDetailsModel.traumasDuringBirth == true
            ? Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: widget.traumasTextController,
                      onChanged: (String text) {
                        widget._babyDetailsModel.traumasDuringBirthNotes = text;
                      },
                      maxLines: null,
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                            borderSide: new BorderSide(color: Colors.grey)),
                        hintText: 'Type in Detail About Traumas During Birth',
                        alignLabelWithHint: true,
                        labelText: 'Type in Detail About Traumas During Birth',
                      )),
                ),
              )
            : Container()
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    widget.traumasTextController.text =
        widget._babyDetailsModel.traumasDuringBirthNotes!;
  }
}
