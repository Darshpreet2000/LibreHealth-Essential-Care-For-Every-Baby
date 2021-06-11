import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newborn_care/screens/list_of_babies/components/custom_drop_down.dart';
import 'package:newborn_care/screens/list_of_babies/components/list_tiem.dart';

class Body extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  final enableDisableScroll;

  Body(this.enableDisableScroll);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchAndSort(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 8, 0),
            child: Text(
              "Recently Added",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          ListItem(
              "Oni", "Prenatal Ward", "Male", Colors.blue[100], Colors.white),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
            child: Text(
              "Past Registered",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          ListItem("Deka", "Prenatal Ward", "Female", Colors.red[100],
              Colors.red[400]),
          ListItem("Priya", "Prenatal Ward", "Female", Colors.yellow[100],
              Colors.yellow[400]),
          ListItem("Jane", "Prenatal Ward", "Male", Colors.green[100],
              Colors.green[400]),
          ListItem("Priya", "Prenatal Ward", "Female", Colors.yellow[100],
              Colors.yellow[400]),
        ],
      ),
    );
  }

  Widget searchAndSort() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: searchContainer()),
          Expanded(child: CustomDropDown(this.enableDisableScroll))
        ],
      ),
    );
  }

  Widget searchContainer() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Search the list of babies",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}