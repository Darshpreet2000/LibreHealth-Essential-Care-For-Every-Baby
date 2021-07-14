import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'components/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatelessWidget {
  final GlobalKey? globalKey;

  const Home({Key? key, this.globalKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          automaticallyImplyLeading: false,
          elevation: 20,
          forceElevated: true,
          pinned: true,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          flexibleSpace: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: MediaQuery.of(context).orientation == Orientation.portrait
                ? ShortAppBar(
                    title: AppLocalizations.of(context)!.eceb,
                    showDrawer: true,
                  )
                : ShortAppBar(
                    title:
                        AppLocalizations.of(context)!.essentialCareForEveryBaby,
                    showDrawer: true,
                  ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          OrientationBuilder(builder: (context, orientation) {
            return SingleChildScrollView(
              child: Body(globalKey: globalKey, orientation: orientation),
            );
          })
        ]))
      ],
    ));
  }
}
