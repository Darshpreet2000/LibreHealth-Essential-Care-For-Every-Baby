import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/long_app_bar.dart';
import 'package:newborn_care/widgets/password.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'package:newborn_care/widgets/sign_in_button.dart';
import 'package:newborn_care/widgets/user_name.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Container(

              child: Column(

                children: [
                  orientation==Orientation.portrait||(MediaQuery.of(context).size.height>600)?LongAppBar():ShortAppBar(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserName(),
                          Password(),
                          SignIn()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );

  }
}
