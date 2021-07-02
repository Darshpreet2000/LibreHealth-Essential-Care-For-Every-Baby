import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_1.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_2.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_3_danger.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_3_normal.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_3_problem.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_4.dart';
import 'package:newborn_care/screens/list_of_babies/components/list_item.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
 


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListItem(
              "Oni", "Prenatal Ward", "Male", Colors.blue[100], Colors.white),
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
