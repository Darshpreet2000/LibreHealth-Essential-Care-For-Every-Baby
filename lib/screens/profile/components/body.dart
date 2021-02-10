import 'package:flutter/material.dart';
import 'package:newborn_care/screens/profile/components/profile_header.dart';
import 'package:newborn_care/screens/profile/components/profile_list.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ShortAppBar(
            title: "ECEB",
            showDrawerID: true,
          ),
          ProfileHeader(),
          ProfileList(),
        ],
      ),
    );
  }
}
