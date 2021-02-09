import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/screens/home/components/register_baby.dart';
import 'package:newborn_care/screens/home/components/summary.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

import 'on_call_doctors.dart';

class Body extends StatelessWidget {
  final Orientation orientation;
  const Body({Key key, this.orientation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        summary(context),
        registerBaby(context),
        onCallDoctors(context)
      ],
    );
  }
}
