import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/screens/list_of_babies/components/custom_drop_down.dart';
import 'package:newborn_care/screens/profile/components/list_item.dart';

class ProfileList extends StatelessWidget {
  final color = const Color(0xff82A0C8);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            listHeading(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                rowItem("Registered \nBabies", "14", context),
                rowItem("Diagnosed/ \nChangelist", "10", context),
                rowItem("Discharged \nBabies", "8", context),
              ],
            ),
            ListItem(),
            ListItem(),
            ListItem(),
            ListItem(),
            ListItem(),
          ],
        ));
  }

  Widget rowItem(String title, String number, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title + ": ",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              number,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

        ],
      ),
    );
  }

  Widget listHeading() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: activityAndSort()
    );
  }
}
Widget activityAndSort() {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
      Expanded(
        flex: 3,
       child: Text("Activity",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)
      ),
        Expanded(
            flex: 2,
            child: SortContainer())
      ],
    ),
  );
}

Widget searchContainer() {
  final color = const Color(0xff82A0C8);

  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Search the list of babies",
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ),
  );
}



class SortContainer extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(

            color: color, borderRadius: BorderRadius.circular(20)),
        child:CustomDropDown()
    );
  }
}


