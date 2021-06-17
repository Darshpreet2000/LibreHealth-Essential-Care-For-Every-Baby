import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  final GlobalKey? globalKey;

  const Home({Key? key, this.globalKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? ShortAppBar(
                  title: "ECEB",
                  showDrawer: true,
                )
              : ShortAppBar(
                  title: "Essential Care For Every Baby",
                  showDrawer: true,
                ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  Body(globalKey: globalKey, orientation: orientation),
                ],
              ),
            ),
          );
        }));
  }
}
