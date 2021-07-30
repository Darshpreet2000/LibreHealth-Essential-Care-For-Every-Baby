import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

import 'components/body.dart';

class DoctorSchedule extends StatelessWidget {
  const DoctorSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ShortAppBar(
            title: AppLocalizations.of(context)!.doctorsSchedule,
            showDrawer: false,
          )),
      body: Body(),
    );
  }
}
