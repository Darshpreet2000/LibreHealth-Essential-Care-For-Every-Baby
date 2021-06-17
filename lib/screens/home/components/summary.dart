import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget summary(BuildContext context, GlobalKey globalKey) {
  final BottomNavigationBar? navigationBar =
      globalKey.currentWidget as BottomNavigationBar?;

  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Summary of 24 hours",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: InkWell(
                    onTap: () {
                      navigationBar!.onTap!(1);
                    },
                    child:
                        rowItem("Admitted", "14", "assets/blue.png", context)),
              ),
              Material(
                child: InkWell(
                    onTap: () {
                      navigationBar!.onTap!(1);
                    },
                    child: rowItem(
                        "Discharged", "10", "assets/grey.png", context)),
              ),
              Material(
                child: InkWell(
                    onTap: () {
                      navigationBar!.onTap!(1);
                    },
                    child:
                        rowItem("High Risk", "8", "assets/red.png", context)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget rowItem(String title, String number, String path, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 4,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    margin: EdgeInsets.all(12),
    child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(path, scale: 2)),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            title + ": ",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            number,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
