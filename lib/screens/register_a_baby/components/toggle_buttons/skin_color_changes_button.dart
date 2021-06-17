import 'package:flutter/material.dart';
import 'package:newborn_care/models/register_baby_model.dart';

class SkinColorChangesButton extends StatefulWidget {
  final String first, second;

  final BabyDetailsModel _babyDetailsModel;

  final TextEditingController skinColorTextController =
      new TextEditingController();
  SkinColorChangesButton(this.first, this.second, this._babyDetailsModel);

  @override
  _SkinColorChangesButtonState createState() => _SkinColorChangesButtonState();
}

class _SkinColorChangesButtonState extends State<SkinColorChangesButton> {
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
                      side: BorderSide(color: Colors.blue, width: 2.5),
                      primary: widget._babyDetailsModel.skinColorChangesNotes !=
                                  null &&
                              widget._babyDetailsModel.skinColorChanges == true
                          ? Colors.blue
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._babyDetailsModel.skinColorChanges = true;
                    });
                  },
                  child: Text(
                    widget.first,
                    style: TextStyle(
                      color: widget._babyDetailsModel.skinColorChangesNotes !=
                                  null &&
                              widget._babyDetailsModel.skinColorChanges == true
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
                      primary: widget._babyDetailsModel.skinColorChangesNotes !=
                                  null &&
                              widget._babyDetailsModel.skinColorChanges == false
                          ? Colors.blue
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._babyDetailsModel.skinColorChanges = false;
                    });
                  },
                  child: Text(
                    widget.second,
                    style: TextStyle(
                      color:  widget._babyDetailsModel.skinColorChangesNotes !=
                                  null &&
                              widget._babyDetailsModel.skinColorChanges == false
                          ? Colors.white
                          : Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
         widget._babyDetailsModel.skinColorChangesNotes !=
                                  null &&
                              widget._babyDetailsModel.skinColorChanges == true
            ? Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: widget.skinColorTextController,
                      onChanged: (String text) {
                        widget._babyDetailsModel.skinColorChangesNotes = text;
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                            borderSide: new BorderSide(color: Colors.grey)),
                        hintText: 'Type in Detail About Skin Color Changes',
                        alignLabelWithHint: true,
                        labelText: 'Type in Detail About Skin Color Changes',
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
    widget.skinColorTextController.text =
        widget._babyDetailsModel.skinColorChangesNotes!;
  }
}
