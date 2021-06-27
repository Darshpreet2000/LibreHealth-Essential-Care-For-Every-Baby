import 'package:flutter/material.dart';
import '../../widgets/short_app_bar.dart';
import 'components/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListOfBabies extends StatefulWidget {
  @override
  _ListOfBabiesState createState() => _ListOfBabiesState();
}

class _ListOfBabiesState extends State<ListOfBabies> {
  bool scrollEnabled = true;
  void enableDisableScroll() {
    setState(() {
      scrollEnabled = !scrollEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: scrollEnabled
          ? AlwaysScrollableScrollPhysics()
          : NeverScrollableScrollPhysics(),
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
              child: ShortAppBar(
                title: AppLocalizations.of(context)!.listOfBabies,
                showDrawer: true,
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Body(enableDisableScroll),
        ]))
      ],
    ));
  }
}
