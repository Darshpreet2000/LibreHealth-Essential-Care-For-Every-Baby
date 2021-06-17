import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/screens/list_of_babies/components/custom_drop_down.dart';
import 'package:newborn_care/screens/profile/components/list_item.dart';

class ProfileList extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  final enableDisableScroll;

  ProfileList(this.enableDisableScroll);

  @override
  Widget build(BuildContext context) {
   
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(16),
              child: Material(
                elevation: 35,
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListItem(listHeading:"Baby of Oni has been registered at prenatal ward",);
                      },
                    )
                  ],
                ),
              ));
        
  }

  Widget rowItem(String title, String number, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(8),
      child: Material(
        elevation: 15,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title + ": ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
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
      ),
    );
  }

  Widget listHeading() {
    return Padding(
        padding: const EdgeInsets.all(8.0), child: activityAndSort());
  }

  Widget activityAndSort() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Activity",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          CustomDropDown(enableDisableScroll)
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
}
