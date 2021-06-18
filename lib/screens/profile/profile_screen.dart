import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

import 'components/body.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool scrollEnabled = true;
  void enableDisableScroll() {
    setState(() {
      scrollEnabled = !scrollEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: scrollEnabled
            ? AlwaysScrollableScrollPhysics()
            : NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            elevation: 20,
            forceElevated: true,
            pinned: true,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            flexibleSpace:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? ShortAppBar(
                        title: "ECEB",
                        showDrawer: true,
                      )
                    : ShortAppBar(
                        title: "Essential Care For Every Baby",
                        showDrawer: true,
                      ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Body(enableDisableScroll),
          ]))
        ],
      ),
    );
  }
}
