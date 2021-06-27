import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationAppBar extends StatelessWidget {
  final TabController? _tabController;

  final color = const Color(0xff82A0C8);

  NotificationAppBar(this._tabController);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      elevation: 20,
      forceElevated: true,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: AppBar(
        brightness: Brightness.dark,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        bottom: TabBar(
          controller: _tabController,
          // give the indicator a decoration (color and border radius)
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 4.0),
              insets: EdgeInsets.symmetric(horizontal: 20.0)),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: [
            // first tab [you can add an icon using the icon property]
            Tab(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.riskAssessments,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),

            // second tab [you can add an icon using the icon property]
            Tab(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.monitoringAlerts,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
