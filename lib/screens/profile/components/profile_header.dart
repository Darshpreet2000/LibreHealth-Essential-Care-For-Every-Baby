import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/models/profile.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/utils/api_config.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 35,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context)!.accountDetails,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${AppLocalizations.of(context)!.name}: ${HiveStorageRepository().getProfile().name}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${AppLocalizations.of(context)!.id}: ${HiveStorageRepository().getProfile().id}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                    httpHeaders: <String, String>{
                      'authorization': basicAuth!,
                    },
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 50,
                          backgroundImage: imageProvider,
                        ),
                    imageUrl: APIConfig().profileImageAPI(
                        HiveStorageRepository().getProfile().avatarID),
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
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Icon(
                          Icons.settings,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.edit),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
