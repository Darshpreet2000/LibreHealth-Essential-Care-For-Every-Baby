import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_1.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_2.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_3_danger.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_3_normal.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_3_problem.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_4.dart';
import 'package:newborn_care/screens/list_of_babies/components/list_item.dart';

class Body extends StatefulWidget {
  final ChildModel childModel;
  const Body({Key? key, required this.childModel}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListItem(widget.childModel, false),
          Phase1(),
          Phase2(),
          Phase3Normal(),
          Phase3Problem(),
          Phase3Danger(),
          Phase4()
        ],
      ),
    );
  }
}
