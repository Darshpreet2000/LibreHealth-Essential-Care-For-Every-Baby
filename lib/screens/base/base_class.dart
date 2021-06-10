import 'package:flutter/material.dart';
import 'package:newborn_care/screens/home/home_screen.dart';
import 'package:newborn_care/screens/list_of_babies/list_of_babies_screen.dart';
import 'package:newborn_care/screens/notifications/notification_screen.dart';
import 'package:newborn_care/screens/profile/profile_screen.dart';

class BaseClass extends StatefulWidget {
  final GlobalKey? globalKey;

  const BaseClass({Key? key, this.globalKey}) : super(key: key);

  @override
  _BaseClassState createState() => _BaseClassState();
}

class _BaseClassState extends State<BaseClass> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: <Widget>[
          Home(
            globalKey: widget.globalKey,
          ),
          ListOfBabies(),
          Notifications(),
          Profile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: widget.globalKey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 25,
              ),
              label: 'List of Babies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue[800],
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
