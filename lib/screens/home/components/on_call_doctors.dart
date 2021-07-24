import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/on_call_doctor_bloc/on_call_doctor_bloc.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/repository/on_call_doctor_repository.dart';
import 'package:newborn_care/utils/api_config.dart';

class OnCallDoctors extends StatefulWidget {
  const OnCallDoctors({Key? key}) : super(key: key);

  @override
  _OnCallDoctorsState createState() => _OnCallDoctorsState();
}

class _OnCallDoctorsState extends State<OnCallDoctors> {
  String? basicAuth;
  List<bool> isActive = [];
  @override
  void initState() {
    Profile profile =
        RepositoryProvider.of<HiveStorageRepository>(context).getProfile();
    basicAuth = 'Basic ' +
        base64Encode(utf8.encode('${profile.username}:${profile.password}'));
    BlocProvider.of<OnCallDoctorBloc>(context).add(FetchOnCallDoctors());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xff82A0C8);
    return BlocBuilder<OnCallDoctorBloc, OnCallDoctorState>(
      builder: (context, state) {
        if (state is OnCallDoctorLoaded) {
          for (int i = 0; i < state.onCallDoctorsList.length; i++) {
            isActive.add(false);
          }
          return state.onCallDoctorsList.length > 0
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context)!.onCallDoctors,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.onCallDoctorsList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                RepositoryProvider.of<OnCallDoctorRepository>(context)
                                    .sendMessageToDoctor(state.onCallDoctorsList[index].doctorID!);
                                setState(() {
                                  isActive[index] = true;
                                  Future.delayed(Duration(seconds: 6))
                                      .then((value) => {
                                            setState(() {
                                              isActive[index] = false;
                                            })
                                          });
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: new Border.all(
                                            color: color,
                                            width: 4.0,
                                          ),
                                        ),
                                        child: CachedNetworkImage(
                                            httpHeaders: <String, String>{
                                              'authorization': basicAuth!,
                                            },
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    CircleAvatar(
                                                      radius: 65,
                                                      backgroundImage:
                                                          imageProvider,
                                                    ),
                                            imageUrl: APIConfig().getImageApi(
                                                state.onCallDoctorsList[index]
                                                    .eventID!),
                                            placeholder: (context, url) =>
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10,
                                                        top: 16,
                                                        bottom: 16,
                                                        right: 10),
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )),
                                            errorWidget: (context, url,
                                                    error) =>
                                                CircleAvatar(
                                                    radius: 65,
                                                    backgroundImage: AssetImage(
                                                        'assets/person.jpg'))),
                                      ),
                                      Text(
                                        state.onCallDoctorsList[index]
                                            .onCallDoctorName!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.online,
                                        style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  isActive[index]
                                      ? alertWidget(
                                          state.onCallDoctorsList[index]
                                              .onCallDoctorName!,
                                          context)
                                      : Container()
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : Container();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget alertWidget(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff82A0C8),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.hasBeenAlerted(name),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        )),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    )),
              ],
            )),
      ),
    );
  }
}
