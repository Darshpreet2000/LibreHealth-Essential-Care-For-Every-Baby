import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

import 'components/body.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool scrollEnabled = true;
  void enableDisableScroll() {
    setState(() {
      scrollEnabled = !scrollEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? ShortAppBar(
                title: "ECEB",
                showDrawerID: true,
              )
            : ShortAppBar(
                title: "Essential Care For Every Baby",
                showDrawerID: true,
              ),
      ),
      body: SingleChildScrollView(
        physics: scrollEnabled
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        child: Container(
          child: Body(enableDisableScroll),
        ),
      ),
    );
  }
}
