import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Scrollbar(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            color: Color(0xff82A0C8)),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/libre_white.png',
                                      width: 250,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .helpingBabiesSurvive,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "The Goal of the Essential Care For Every Baby Project provide clinical decision-support for nurses and doctors delivering essential newborn care interventions during the first day of life." +
                            "This application provides knowledge, skills, and competencies to nurses and doctors in low/middle-income settings so that they can provide life-saving care to newborns from birth through 24 hours postnatal." +
                            " This App can work offline and can update downloaded data." +
                            "\n This is Free & Open Source project," +
                            " you can visit to LibreHealth to know more about it & can contribute if you have an interesting idea",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.8,
                          fontFamily: 'Source',
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              padding: EdgeInsets.all(8),
                            ),
                            onPressed: () {
                              try {
                                _launchURL();
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            },
                            child: Text(
                              'Visit Project',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Source',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://gitlab.com/librehealth/incubating-projects/mhbs/lh-mhbs-eceb';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }
}
