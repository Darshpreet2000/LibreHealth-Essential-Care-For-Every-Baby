import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'components/body.dart';

class RegisterABaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: ShortAppBar(
            title: AppLocalizations.of(context)!.registration,
            showDrawer: false,
          )),
      body: Body(),
    );
  }
}
