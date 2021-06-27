import 'package:flutter/material.dart';
import 'package:newborn_care/models/register_baby_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModeOfDeliveryButton extends StatefulWidget {
  final String first, second;

  final RegisterBabyModel _registerBabyModel;

  ModeOfDeliveryButton(this.first, this.second, this._registerBabyModel);

  @override
  _ModeOfDeliveryButtonState createState() => _ModeOfDeliveryButtonState();
}

class _ModeOfDeliveryButtonState extends State<ModeOfDeliveryButton> {
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
                      primary: widget._registerBabyModel.modeOfDelivery !=
                                  null &&
                              widget._registerBabyModel.modeOfDelivery == true
                          ? Colors.blue
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._registerBabyModel.modeOfDelivery = true;
                    });
                  },
                  child: Text(
                    widget.first,
                    style: TextStyle(
                      color: widget._registerBabyModel.modeOfDelivery != null &&
                              widget._registerBabyModel.modeOfDelivery == true
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
                      primary: widget._registerBabyModel.modeOfDelivery !=
                                  null &&
                              widget._registerBabyModel.modeOfDelivery == false
                          ? Colors.blue
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._registerBabyModel.modeOfDelivery = false;
                    });
                  },
                  child: Text(
                    widget.second,
                    style: TextStyle(
                      color: widget._registerBabyModel.modeOfDelivery != null &&
                              widget._registerBabyModel.modeOfDelivery == false
                          ? Colors.white
                          : Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        widget._registerBabyModel.modeOfDelivery != null &&
                widget._registerBabyModel.modeOfDelivery == false
            ? ModeOfDeliverySlider(widget._registerBabyModel)
            : Container()
      ],
    );
  }
}

class ModeOfDeliverySlider extends StatefulWidget {
  final RegisterBabyModel _registerBabyModel;
  final List<bool> modeOfDeliveryList = [false, false, false, false];
  ModeOfDeliverySlider(this._registerBabyModel);

  @override
  _ModeOfDeliverySliderState createState() => _ModeOfDeliverySliderState();
}

class _ModeOfDeliverySliderState extends State<ModeOfDeliverySlider> {
  void selectIndex(int index) {
    print(widget._registerBabyModel.wardName);
    setState(() {
      for (int i = 0; i < widget.modeOfDeliveryList.length; i++) {
        widget.modeOfDeliveryList[i] = false;
      }
      widget.modeOfDeliveryList[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Stack(
        children: [
          Divider(
            thickness: 4,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width - 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => selectIndex(0),
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[0]
                                  ? Colors.blue
                                  : Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[0]
                                  ? Colors.blue
                                  : null,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            AppLocalizations.of(context)!.cSection,
                            style: TextStyle(
                              color: widget.modeOfDeliveryList[0]
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => selectIndex(1),
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[1]
                                  ? Colors.blue
                                  : Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[1]
                                  ? Colors.blue
                                  : null,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            AppLocalizations.of(context)!.forcepsDelivery,
                            style: TextStyle(
                              color: widget.modeOfDeliveryList[1]
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => selectIndex(2),
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[2]
                                  ? Colors.blue
                                  : Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[2]
                                  ? Colors.blue
                                  : null,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            AppLocalizations.of(context)!.vacuumExtraction,
                            style: TextStyle(
                              color: widget.modeOfDeliveryList[2]
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => selectIndex(3),
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[3]
                                  ? Colors.blue
                                  : Colors.white,
                              border: Border.all(color: Colors.blueAccent),
                              shape: BoxShape.circle),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: widget.modeOfDeliveryList[3]
                                  ? Colors.blue
                                  : null,
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            AppLocalizations.of(context)!.other,
                            style: TextStyle(
                              color: widget.modeOfDeliveryList[3]
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
