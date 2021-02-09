import 'package:flutter/material.dart';

import '../../widgets/short_app_bar.dart';

class ListOfBabies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ShortAppBar(
              title: "List of Babies",
            )
          ],
        ),
      ),
    );
  }
}
