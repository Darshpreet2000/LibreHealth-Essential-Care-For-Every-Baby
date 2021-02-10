import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

class BabyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ShortAppBar(
            title: "Baby Details",
            showDrawerID: true,
          ),
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
    );
  }
}
