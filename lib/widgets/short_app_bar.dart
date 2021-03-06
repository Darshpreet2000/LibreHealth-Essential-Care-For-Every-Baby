import 'package:flutter/material.dart';
import 'package:newborn_care/repository/hive_storage_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main.dart';

class ShortAppBar extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  final title;
  final bool? showDrawer;
  const ShortAppBar({Key? key, required this.title, required this.showDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        new Container(),
      ],
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(35),
      )),
      leading: showDrawer!
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 28,
                ),
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
              ),
            )
          : null,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.id +
                ": ${HiveStorageRepository().getProfile().id}",
            style: new TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(),
          SafeArea(
            child: Image.asset(
              "assets/mhbs.png",
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
