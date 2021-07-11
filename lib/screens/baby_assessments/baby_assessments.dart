import 'package:flutter/material.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/screens/baby_assessments/components/body.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

class BabyAssessments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final childModel = ModalRoute.of(context)!.settings.arguments as ChildModel;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? ShortAppBar(
                  title: "ECEB",
                  showDrawer: false,
                )
              : ShortAppBar(
                  title: "Essential Care For Every Baby",
                  showDrawer: false,
                ),
        ),
        body: SingleChildScrollView(
            child: Body(
          childModel: childModel,
        )));
  }
}
