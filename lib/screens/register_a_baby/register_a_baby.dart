import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

class RegisterABaby extends StatelessWidget {
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
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Expanded(
                child: Text(
              "This Screen is Pending",
              style: TextStyle(
                fontSize: 18,
              ),
            )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
