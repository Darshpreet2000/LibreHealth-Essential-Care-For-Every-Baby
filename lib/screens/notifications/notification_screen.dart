import 'package:flutter/material.dart';
import 'package:newborn_care/screens/notifications/components/notification_app_bar.dart';

import 'components/body.dart';

final color = const Color(0xff82A0C8);

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [NotificationAppBar(_tabController)];
            },
            body: Body(_tabController)),
      ),
    );
  }
}
