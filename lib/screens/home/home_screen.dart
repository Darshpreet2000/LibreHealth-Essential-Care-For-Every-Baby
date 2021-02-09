import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              orientation == Orientation.portrait
                  ? ShortAppBar(
                      title: "ECEB",
                      hideDrawerID: true,
                    )
                  : ShortAppBar(
                      title: "Essential Care For Every Baby",
                      hideDrawerID: true,
                    ),
              Body(orientation: orientation),
            ],
          ),
        ),
      );
    }));
  }
}
