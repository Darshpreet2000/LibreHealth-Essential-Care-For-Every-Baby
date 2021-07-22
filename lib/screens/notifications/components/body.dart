import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/notification_bloc/notification_bloc.dart';
import 'package:newborn_care/screens/notifications/components/list_item_monitoring_alert.dart';
import 'list_item_risk_assessment.dart';

class Body extends StatelessWidget {
  final TabController? _tabController;

  Body(this._tabController);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoaded)
          return TabBarView(
            controller: _tabController,
            children: [
              // first tab bar view widget
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.riskAssessments.length,
                itemBuilder: (context, index) {
                  return ListItemRiskAssessment(
                    notificationModel: state.riskAssessments[index],
                  );
                },
              ),
              // second tab bar view widget
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.monitoringAlerts.length,
                itemBuilder: (context, index) {
                  return ListItemRiskMonitoringAlert(
                    state.monitoringAlerts[index],
                  );
                },
              ),
            ],
          );
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
