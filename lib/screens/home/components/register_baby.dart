import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget registerBaby(BuildContext context) {
  final color = const Color(0xff82A0C8);

  return Container(
    height: 150,
    color: color,
    child: Row(
      children: [
        Spacer(),
        Container(
          height: 90,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // background
              onPrimary: Colors.white, // foreground
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/RegisterABaby');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/register.png',
                      width: 60,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "To Register a Baby",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    ),
  );
}
