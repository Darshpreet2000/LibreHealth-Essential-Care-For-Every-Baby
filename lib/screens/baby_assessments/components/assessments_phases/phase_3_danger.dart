import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Phase3Danger extends StatelessWidget {
  const Phase3Danger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "The baby has been classified as Danger",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Following interventions to be taken:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    "Gave Antibiotics",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CheckboxListTile(
                  title: Text(
                    "Sought Advanced Care",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  value: false,
                  onChanged: (newValue) {},
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
