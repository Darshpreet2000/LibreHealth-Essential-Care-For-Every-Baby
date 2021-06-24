import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget registerBaby(BuildContext context) {
  final color = const Color(0xff82A0C8);

  return Container(
    height: 150,
    color: color,
    child: Row(
      children: [
        Spacer(),
        Container(
          height: 90,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/RegisterABaby');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/register.png',
                      width: 60,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context)!.toRegisterABaby,
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.subtitle1!.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    ),
  );
}
