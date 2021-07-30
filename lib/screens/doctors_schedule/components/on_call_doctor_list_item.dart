import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newborn_care/models/on_call_doctor_model.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:newborn_care/utils/api_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnCallDoctorListItem extends StatefulWidget {
  final OnCallDoctorModel onCallDoctorModel;

  const OnCallDoctorListItem({Key? key, required this.onCallDoctorModel})
      : super(key: key);

  @override
  _OnCallDoctorListItemState createState() => _OnCallDoctorListItemState();
}

class _OnCallDoctorListItemState extends State<OnCallDoctorListItem> {
  String? basicAuth;
  final color = const Color(0xff82A0C8);
  @override
  void initState() {
    Profile profile =
        RepositoryProvider.of<HiveStorageRepository>(context).getProfile();
    basicAuth = 'Basic ' +
        base64Encode(utf8.encode('${profile.username}:${profile.password}'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
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
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                            radius: 40,
                            backgroundImage: imageProvider,
                          ),
                      imageUrl: APIConfig()
                          .getImageApi(widget.onCallDoctorModel.eventID!),
                      placeholder: (context, url) => Container(
                          margin: EdgeInsets.only(
                              left: 10, top: 16, bottom: 16, right: 10),
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(),
                          )),
                      errorWidget: (context, url, error) => CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/person.jpg'))),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        widget.onCallDoctorModel.onCallDoctorName!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)!.date + ": "),
                          Text(
                            DateFormat('yyyy-MM-dd').format(widget
                                .onCallDoctorModel.onCallDoctorScheduleDate!),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)!.startTime + ": "),
                          Text(
                            DateFormat.jm().format(widget
                                .onCallDoctorModel.onCallDoctorShiftStartTime!),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)!.endTime + ": "),
                          Text(
                            DateFormat.jm().format(widget
                                .onCallDoctorModel.onCallDoctorShiftEndTime!),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
