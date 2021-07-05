import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/assessments_bloc/bloc/assessments_bloc.dart';
import 'package:newborn_care/bloc/refresh_bloc/refresh_bloc.dart';
import 'package:newborn_care/models/child_model.dart';
import 'package:newborn_care/models/stage_1.dart';
import 'package:newborn_care/screens/baby_assessments/components/assessments_phases/phase_1.dart';
import 'package:newborn_care/screens/list_of_babies/components/list_item.dart';

class Body extends StatefulWidget {
  final ChildModel childModel;
  final AssessmentsBloc assessmentsBloc;
  const Body(
      {Key? key, required this.childModel, required this.assessmentsBloc})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    widget.assessmentsBloc.add(AssessmentsEventFetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AssessmentsBloc, AssessmentsState>(
      bloc: widget.assessmentsBloc,
      listener: (context, state) {
        if (state is AssessmentsAdded) {
          BlocProvider.of<RefreshBloc>(context).add(RefreshEventStart());
        }
        if (state is AssessmentsError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            duration: const Duration(seconds: 3),
          ));
        }
      },
      child: BlocBuilder<AssessmentsBloc, AssessmentsState>(
        bloc: widget.assessmentsBloc,
        builder: (context, state) {
          if (state is AssessmentsInitial || state is AssessmentsAdded)
            return Container(
              child: Column(
                children: [
                  ListItem(widget.childModel, false),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.childModel.assessmentsList.length,
                    itemBuilder: (context, index) {
                      if (state.childModel.assessmentsList[index] is Stage1) {
                        return Phase1(
                            state.childModel.assessmentsList[index] as Stage1,
                            widget.assessmentsBloc);
                      }

                      return Container();
                    },
                  ),
                ],
              ),
            );
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
