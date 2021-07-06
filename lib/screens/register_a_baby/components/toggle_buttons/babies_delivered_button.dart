import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/register_baby_bloc/register_baby_bloc.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BabiesDeliveredButton extends StatefulWidget {
  final String first, second;

  final RegisterBabyModel _registerBabyModel;
  BabiesDeliveredButton(this.first, this.second, this._registerBabyModel);

  @override
  _BabiesDeliveredButtonState createState() => _BabiesDeliveredButtonState();
}

class _BabiesDeliveredButtonState extends State<BabiesDeliveredButton> {
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
                      primary: widget._registerBabyModel.babiesDelivered !=
                                  null &&
                              widget._registerBabyModel.babiesDelivered == true
                          ? Colors.blue
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._registerBabyModel.babiesDelivered = true;
                    });
                  },
                  child: Text(
                    widget.first,
                    style: TextStyle(
                      color: widget._registerBabyModel.babiesDelivered !=
                                  null &&
                              widget._registerBabyModel.babiesDelivered == true
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
                      primary: widget._registerBabyModel.babiesDelivered !=
                                  null &&
                              widget._registerBabyModel.babiesDelivered == false
                          ? Colors.blue
                          : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget._registerBabyModel.babiesDelivered = false;
                    });
                  },
                  child: Text(
                    widget.second,
                    style: TextStyle(
                      color: widget._registerBabyModel.babiesDelivered !=
                                  null &&
                              widget._registerBabyModel.babiesDelivered == false
                          ? Colors.white
                          : Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        widget._registerBabyModel.babiesDelivered != null &&
                widget._registerBabyModel.babiesDelivered == false
            ? Center(child: ChildrenSlider(widget._registerBabyModel))
            : Container()
      ],
    );
  }
}

class ChildrenSlider extends StatefulWidget {
  final RegisterBabyModel _registerBabyModel;

  ChildrenSlider(this._registerBabyModel);

  @override
  _ChildrenSliderState createState() => _ChildrenSliderState();
}

class _ChildrenSliderState extends State<ChildrenSlider> {
  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data: SfSliderThemeData(
        activeMinorTickColor: Colors.red,
        inactiveMinorTickColor: Colors.red[200],
      ),
      child: SfSlider(
        min: 1.0,
        max: 4.0,
        interval: 1,
        showTicks: true,
        showLabels: true,
        enableTooltip: true,
        tooltipShape: SfPaddleTooltipShape(),
        value: widget._registerBabyModel.children.length.toDouble(),
        onChanged: (dynamic newValue) {
          setState(() {
            double temp = newValue;
            int pass = temp.round().toInt();
            BlocProvider.of<RegisterBabyBloc>(context)
                .add(ChangeChildrenCount(pass));
          });
        },
      ),
    );
  }
}
