import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/assessments_bloc/assessments_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_4.dart';
import 'package:newborn_care/screens/baby_assessments/components/body.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BabyAssessments extends StatefulWidget {
  final ChildModel childModel;
  final AssessmentsBloc assessmentsBloc;

  const BabyAssessments(this.childModel, this.assessmentsBloc);

  @override
  _BabyAssessmentsState createState() => _BabyAssessmentsState();
}

class _BabyAssessmentsState extends State<BabyAssessments> {
  @override
  void dispose() {
    widget.assessmentsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? ShortAppBar(
                  title: "ECEB",
                  showDrawer: false,
                )
              : ShortAppBar(
                  title: "Essential Care For Every Baby",
                  showDrawer: false,
                ),
        ),
        body: SingleChildScrollView(
            child: Body(
          childModel: widget.childModel,
          assessmentsBloc: widget.assessmentsBloc,
        )),
        floatingActionButton: BlocBuilder<AssessmentsBloc, AssessmentsState>(
          bloc: widget.assessmentsBloc,
          builder: (context, state) {
            if (state is AssessmentsInitial ||
                state is AssessmentsAdded ||
                state is AssessmentsLoading)
              return state.childModel.classification ==
                          AppLocalizations.of(context)!.normal &&
                      DateTime.now()
                              .difference(state.childModel.birthTime)
                              .inHours >
                          24 &&
                      widget.childModel.isCompleted == false &&
                      (state.childModel.assessmentsList.last is Stage4)
                  ? FloatingActionButton.extended(
                      backgroundColor: Colors.red[600],
                      label: Text(
                        'Discharge',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        widget.assessmentsBloc.add(DischargeButtonClick());
                      })
                  : Container();
            return Container();
          },
        ));
  }
}
