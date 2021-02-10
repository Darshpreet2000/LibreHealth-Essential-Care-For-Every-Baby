import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  final GlobalKey globalKey;

  const Home({Key key, this.globalKey}) : super(key: key);

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
                      showDrawerID: true,
                    )
                  : ShortAppBar(
                      title: "Essential Care For Every Baby",
                      showDrawerID: true,
                    ),
              Body(globalKey: globalKey, orientation: orientation),
            ],
          ),
        ),
      );
    }));
  }
}
