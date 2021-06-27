import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LongAppBar extends StatelessWidget {
  final color = const Color(0xff82A0C8);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.65,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset("assets/mhbs.png"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                AppLocalizations.of(context)!.essentialCareForEveryBaby,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(40.0),
              bottomRight: const Radius.circular(40.0))),
    );
  }
}
