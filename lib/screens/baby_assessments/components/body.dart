import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/screens/list_of_babies/components/list_item.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
 


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListItem(
              "Oni", "Prenatal Ward", "Male", Colors.blue[100], Colors.white),
         
        ],
      ),
    );
  }
}
