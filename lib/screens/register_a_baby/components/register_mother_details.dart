import 'package:flutter/material.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/screens/register_a_baby/components/toggle_buttons/babies_delivered_button.dart';
import 'package:newborn_care/screens/register_a_baby/components/toggle_buttons/mode_of_delivery_button.dart';

class RegisterMotherDetails extends StatefulWidget {
  final RegisterBabyModel _registerBabyModel;
  final TextEditingController _motherNameTextController =
      new TextEditingController();
  final TextEditingController _wardNameTextController =
      new TextEditingController();
  RegisterMotherDetails(this._registerBabyModel) {
    _motherNameTextController.text = _registerBabyModel.motherName!;
    _wardNameTextController.text = _registerBabyModel.wardName!;
  }

  @override
  _RegisterMotherDetailsState createState() => _RegisterMotherDetailsState();
}

class _RegisterMotherDetailsState extends State<RegisterMotherDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mother's Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: widget._motherNameTextController,
                onChanged: (String _value) {
                  widget._registerBabyModel.motherName = _value;
                },
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                      borderSide: new BorderSide(color: Colors.grey)),
                  hintText: 'Mother\'s Name',
                  labelText: 'Mother\'s Name',
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: widget._wardNameTextController,
                onChanged: (String _value) {
                  widget._registerBabyModel.wardName = _value;
                },
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                      borderSide: new BorderSide(color: Colors.grey)),
                  hintText: 'Ward\'s Name',
                  labelText: 'Ward\'s Name',
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Babies Delivered",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          BabiesDeliveredButton(
              "Single", "Multiple", widget._registerBabyModel),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mode of Delivery",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ModeOfDeliveryButton("Normal", "Others", widget._registerBabyModel),
        ],
      ),
    );
  }
}
