import 'package:flutter/material.dart';
import 'package:newborn_care/screens/notifications/components/list_item_monitoring_alert.dart';
import 'package:newborn_care/screens/notifications/components/list_item_risk_assessment.dart';

class NotificationAppBar extends StatefulWidget {
  @override
  _NotificationAppBarState createState() => _NotificationAppBarState();
}

class _NotificationAppBarState extends State<NotificationAppBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final color = const Color(0xff82A0C8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: color,
              borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0))),
          child: TabBar(
            controller: _tabController,
            // give the indicator a decoration (color and border radius)
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.white, width: 4.0),
                insets: EdgeInsets.symmetric(horizontal: 18.0)),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              // first tab [you can add an icon using the icon property]
              Tab(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Risk Assessments',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),

              // second tab [you can add an icon using the icon property]
              Tab(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Monitoring Alerts',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
        // tab bar view here
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // first tab bar view widget
              ListView(
                children: [
                  ListItemRiskAssessment(
                    parent: "Oni",
                    color: Colors.green,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskAssessment(
                    parent: "Ada",
                    color: Colors.red,
                    value: true,
                    inDanger: true,
                  ),
                  ListItemRiskAssessment(
                    parent: "Teka",
                    color: Colors.yellow,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskAssessment(
                    parent: "Avi",
                    color: Colors.green,
                    value: true,
                    inDanger: true,
                  ),
                  ListItemRiskAssessment(
                    parent: "Oni",
                    color: Colors.green,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskAssessment(
                    parent: "Ada",
                    color: Colors.red,
                    value: true,
                    inDanger: true,
                  ),
                  ListItemRiskAssessment(
                    parent: "Teka",
                    color: Colors.yellow,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskAssessment(
                    parent: "Avi",
                    color: Colors.green,
                    value: true,
                    inDanger: true,
                  ),
                  ListItemRiskAssessment(
                    parent: "Oni",
                    color: Colors.green,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskAssessment(
                    parent: "Ada",
                    color: Colors.red,
                    value: true,
                    inDanger: true,
                  ),
                  ListItemRiskAssessment(
                    parent: "Teka",
                    color: Colors.yellow,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskAssessment(
                    parent: "Avi",
                    color: Colors.green,
                    value: true,
                    inDanger: true,
                  ),
                ],
              ),

              // second tab bar view widget
              ListView(
                children: [
                  ListItemRiskMonitoringAlert(
                    parent: "Oni",
                    checkup: "Post 90 min Checkup",
                    color: Colors.green,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Jane",
                    checkup: "25-30 min Checkup",
                    color: Colors.red,
                    value: true,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Avi",
                    checkup: "3 hr- 4 hr Checkup",
                    color: Colors.yellow,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Oni",
                    checkup: "Post 90 min Checkup",
                    color: Colors.green,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Avi",
                    checkup: "3 hr- 4 hr Checkup",
                    color: Colors.yellow,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Jane",
                    checkup: "25-30 min Checkup",
                    color: Colors.red,
                    value: true,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Jane",
                    checkup: "25-30 min Checkup",
                    color: Colors.red,
                    value: true,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Avi",
                    checkup: "3 hr- 4 hr Checkup",
                    color: Colors.yellow,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Oni",
                    checkup: "Post 90 min Checkup",
                    color: Colors.green,
                    value: false,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Jane",
                    checkup: "25-30 min Checkup",
                    color: Colors.red,
                    value: true,
                    inDanger: false,
                  ),
                  ListItemRiskMonitoringAlert(
                    parent: "Avi",
                    checkup: "3 hr- 4 hr Checkup",
                    color: Colors.yellow,
                    value: false,
                    inDanger: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
