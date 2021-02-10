import 'package:flutter/material.dart';

import '../../widgets/short_app_bar.dart';
import 'components/body.dart';

class ListOfBabies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ShortAppBar(
              title: "List of Babies",
              showDrawerID: true,
            ),
            Body(),
          ],
        ),
      ),
    ));
  }
}
