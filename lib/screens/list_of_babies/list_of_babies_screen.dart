import 'package:flutter/material.dart';

import '../../widgets/short_app_bar.dart';
import 'components/body.dart';

class ListOfBabies extends StatefulWidget {
  @override
  _ListOfBabiesState createState() => _ListOfBabiesState();
}

class _ListOfBabiesState extends State<ListOfBabies> {
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
                  title: "List of Babies",
                  showDrawerID: true,
                )
              : ShortAppBar(
                  title: "List of Babies",
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
        ));
  }
}
