import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/bloc/on_call_doctor_bloc/on_call_doctor_bloc.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/utils/api_config.dart';

class OnCallDoctors extends StatefulWidget {
  const OnCallDoctors({Key? key}) : super(key: key);

  @override
  _OnCallDoctorsState createState() => _OnCallDoctorsState();
}

class _OnCallDoctorsState extends State<OnCallDoctors> {
  String? basicAuth;

  @override
  void initState() {
    Profile profile =
        RepositoryProvider.of<HiveStorageRepository>(context).getProfile();
    basicAuth =
        'Basic ' + base64Encode(utf8.encode('${profile.username}:${profile.password}'));
    BlocProvider.of<OnCallDoctorBloc>(context).add(FetchOnCallDoctors());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xff82A0C8);
    return BlocBuilder<OnCallDoctorBloc, OnCallDoctorState>(
      builder: (context, state) {
        if (state is OnCallDoctorLoaded)
          return Padding(
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
                SizedBox( height:150, 
                  child: ListView.builder(
                   
                              scrollDirection: Axis.horizontal,
                    itemCount: state.onCallDoctorsList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 100,
                            width: 120,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                  color: color,
                                  width: 4.0,
                                ),
                              ),
                              child: 
                                  
                              CachedNetworkImage(
                                
                                httpHeaders: <String, String>{
                                  'authorization': basicAuth!,
                                },
                                imageBuilder: (context, imageProvider) =>
                               CircleAvatar( radius: 65,
                                 backgroundImage: imageProvider,
                               ),
                                imageUrl: APIConfig().getImageApi(
                                    state.onCallDoctorsList[index].eventID!),
                                placeholder: (context, url) => Container(
                                    margin: EdgeInsets.only(
                                        left: 10, top: 16, bottom: 16, right: 10),
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    )),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                      radius: 65,
                                      backgroundImage: AssetImage('assets/person.jpg'))),
                            
                              ),
                          Text(
                            state.onCallDoctorsList[index].onCallDoctorName!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
