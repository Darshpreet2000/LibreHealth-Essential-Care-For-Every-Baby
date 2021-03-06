import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/list_of_babies_bloc/list_of_babies_bloc.dart';
import 'package:newborn_care/bloc/refresh_bloc/refresh_bloc.dart';
import 'package:newborn_care/bloc/register_baby_bloc/register_baby_bloc.dart';
import 'package:newborn_care/models/register_baby_model.dart';
import 'package:newborn_care/screens/register_a_baby/components/register_baby_details.dart';
import 'package:newborn_care/screens/register_a_baby/components/register_mother_details.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBabyBloc, RegisterBabyState>(
      listener: (context, state) {
        if (state is RegisterBabyErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message!),
            duration: const Duration(seconds: 3),
          ));
        }
        if (state is RegisterBabyRegisteredState) {
          //push data to dhis2 using api
          BlocProvider.of<RefreshBloc>(context).add(RefreshEventStart());
          // refresh list of babies screen
          BlocProvider.of<ListOfBabiesBloc>(context)
              .add(ListOfBabiesRefreshList());

          Navigator.pop(context);
        }
      },
      child: BlocBuilder<RegisterBabyBloc, RegisterBabyState>(
          builder: (BuildContext context, state) {
        if (state is RegisterBabyInitialState) {
          RegisterBabyModel registerBabyModel = state.getRegisterModel;

          return SingleChildScrollView(
            child: Column(
              children: [
                RegisterMotherDetails(registerBabyModel),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: registerBabyModel.children.length,
                  itemBuilder: (context, index) {
                    return RegisterBabyDetails(
                        registerBabyModel.children[index]);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                      onPressed: () {
                        BlocProvider.of<RegisterBabyBloc>(context)
                            .add(RegisterBaby(context));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
