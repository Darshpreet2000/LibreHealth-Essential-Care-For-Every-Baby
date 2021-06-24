import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newborn_care/widgets/long_app_bar.dart';
import 'package:newborn_care/widgets/short_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              orientation == Orientation.portrait ||
                      (MediaQuery.of(context).size.height > 600)
                  ? Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: LongAppBar())
                  : Container(
                      child: ShortAppBar(
                      title: AppLocalizations.of(context)!.essentialCareForEveryBaby,
                    )),
              loginButtons(context, orientation)
            ],
          ),
        ),
      );
    }));
  }

  Widget loginButtons(BuildContext context, Orientation orientation) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              height: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height / 6
                  : MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 1.4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SizedBox(
                  width: double.infinity, // match_parent

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white, // foreground
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[350]!),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/IndividualLoginScreen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.individual,
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontFamily: 'Source',
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height / 6
                  : MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 1.4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SizedBox(
                  width: double.infinity, // match_parent

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white, // foreground
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[350]!),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/IndividualLoginScreen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.facility,
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontFamily: 'Source',
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RichText(
                text: new TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: '${AppLocalizations.of(context)!.byContinuingYouAgreeToOur} '),
                    new TextSpan(
                        text: '${AppLocalizations.of(context)!.privacyPolicies}',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        )),
                    new TextSpan(
                        text: ' ${AppLocalizations.of(context)!.includingOur} ', style: new TextStyle()),
                    new TextSpan(
                        text: AppLocalizations.of(context)!.cookiesUse,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        )),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
