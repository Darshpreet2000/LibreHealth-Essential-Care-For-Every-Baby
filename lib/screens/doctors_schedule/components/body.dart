import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/on_call_doctor_bloc/on_call_doctor_bloc.dart';
import 'package:newborn_care/models/on_call_doctor_model.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/screens/doctors_schedule/components/on_call_doctor_list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnCallDoctorBloc, OnCallDoctorState>(
      builder: (context, state) {
      if (state is OnCallDoctorLoaded) {
          List<OnCallDoctorModel> result =
              RepositoryProvider.of<HiveStorageRepository>(context)
                  .getOnCallDoctors();
          return ListView.builder(
             itemBuilder: (context, index) {
                      return OnCallDoctorListItem(onCallDoctorModel:  result[index],);
                    },
          );
        }
         return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
      },
    );
  }
}
