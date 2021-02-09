import 'package:flutter/material.dart';

import 'components/body.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Body(),
        ),
      ),
    );
  }
}
