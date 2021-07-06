import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.all(16),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.shareLocation}: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Switch(
                              value: isOn,
                              onChanged: (value) {
                                setState(() {
                                  isOn = value;
                                });
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/doctor1.jpg'),
                      radius: 50,
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.settings),
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
    );
  }
}
