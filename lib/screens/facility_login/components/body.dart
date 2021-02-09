import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/long_app_bar.dart';
import 'package:newborn_care/widgets/password.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'package:newborn_care/widgets/sign_in_button.dart';
import 'package:newborn_care/widgets/user_name.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var textController = new TextEditingController();
  refresh() {
    setState(() {
      textController.text = "fiona@diakfka.com";
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              orientation == Orientation.portrait ||
                      (MediaQuery.of(context).size.height > 600)
                  ? LongAppBar()
                  : ShortAppBar(
                      title: "Essential Care For Every Baby",
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserName(
                        textController: textController,
                        notifyParent: refresh,
                      ),
                      Password(
                        textController: textController,
                        notifyParent: refresh,
                      ),
                      SignIn(
                        textController: textController,
                        notifyParent: refresh,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
