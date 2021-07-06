import 'package:flutter/material.dart';

import 'list_item_monitoring_alert.dart';
import 'list_item_risk_assessment.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  final TabController? _tabController;

  Body(this._tabController);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
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
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.green,
              value: false,
              inDanger: false,
            ),
            ListItemRiskMonitoringAlert(
              parent: "Jane",
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.red,
              value: true,
              inDanger: false,
            ),
            ListItemRiskMonitoringAlert(
              parent: "Avi",
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.yellow,
              value: false,
              inDanger: false,
            ),
            ListItemRiskMonitoringAlert(
              parent: "Avi",
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.yellow,
              value: false,
              inDanger: false,
            ),
            ListItemRiskMonitoringAlert(
              parent: "Avi",
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.yellow,
              value: false,
              inDanger: false,
            ),
            ListItemRiskMonitoringAlert(
              parent: "Jane",
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.red,
              value: true,
              inDanger: false,
            ),
            ListItemRiskMonitoringAlert(
              parent: "Jane",
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.red,
              value: true,
              inDanger: false,
            ),
            ListItemRiskMonitoringAlert(
              parent: "Avi",
              checkup: AppLocalizations.of(context)!.postCheckup("90"),
              color: Colors.yellow,
              value: false,
              inDanger: false,
            ),
          ],
        ),
      ],
    );
  }
}
