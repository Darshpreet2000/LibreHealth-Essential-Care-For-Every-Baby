import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/screens/home/components/register_baby.dart';
import 'package:newborn_care/screens/home/components/summary.dart';

import 'on_call_doctors.dart';

class Body extends StatelessWidget {
  final GlobalKey? globalKey;

  final Orientation? orientation;

  const Body({Key? key, this.globalKey, this.orientation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        summary(context, globalKey!),
        registerBaby(context),
        OnCallDoctors(),
      ],
    );
  }
}
