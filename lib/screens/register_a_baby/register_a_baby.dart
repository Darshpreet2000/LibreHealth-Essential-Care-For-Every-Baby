import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

import 'components/body.dart';

class RegisterABaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ShortAppBar(
            title: "Registration",
            showDrawer: false,
          )),
      body: Body(),
    );
  }
}
