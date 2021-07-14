import 'package:flutter/material.dart';

class ShortAppBarLogin extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  final title;
  const ShortAppBarLogin({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(35),
      )),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Image.asset(
                "assets/mhbs.png",
                width: 70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
