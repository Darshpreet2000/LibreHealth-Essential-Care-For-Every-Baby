import 'package:flutter/material.dart';
import 'package:newborn_care/screens/profile/components/profile_header.dart';
import 'package:newborn_care/screens/profile/components/profile_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(),
        ProfileList(),
      ],
    );
  }
}
