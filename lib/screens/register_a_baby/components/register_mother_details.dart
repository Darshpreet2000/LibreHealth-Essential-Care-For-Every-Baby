import 'package:flutter/material.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/screens/register_a_baby/components/toggle_buttons/babies_delivered_button.dart';
import 'package:newborn_care/screens/register_a_baby/components/toggle_buttons/mode_of_delivery_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.mothersDetails,
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
                    hintText: AppLocalizations.of(context)!.mothersName,
                    labelText: AppLocalizations.of(context)!.mothersName)),
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
                  hintText: AppLocalizations.of(context)!.wardsName,
                  labelText: AppLocalizations.of(context)!.wardsName,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.babiesDelivered,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          BabiesDeliveredButton(
              AppLocalizations.of(context)!.single,
              AppLocalizations.of(context)!.multiple,
              widget._registerBabyModel),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.modeOfDelivery,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ModeOfDeliveryButton(AppLocalizations.of(context)!.normal,
              AppLocalizations.of(context)!.others, widget._registerBabyModel),
        ],
      ),
    );
  }
}
