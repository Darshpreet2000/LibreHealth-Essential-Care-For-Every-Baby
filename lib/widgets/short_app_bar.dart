import 'package:flutter/material.dart';

class ShortAppBar extends StatelessWidget {
  final color = const Color(0xff82A0C8);

  @override
  Widget build(BuildContext context) {
    return   Container(

      height:  MediaQuery.of(context).size.height/3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Essential Care For Every Baby",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Image.asset("assets/mhbs.png"),
            ),
          ),

        ],
      ),
      decoration: BoxDecoration( boxShadow: [
        new BoxShadow(blurRadius: 4.0)
      ],
          color: color,
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(40.0),
              bottomRight: const Radius.circular(40.0))),
    );
  }
}
