import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ListItem extends StatelessWidget {
  final String parent, ward, gender;
  final Color? color, darkColor;

  const ListItem(this.parent, this.ward, this.gender, this.color, this.darkColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      color: darkColor,
      child: Material(
        elevation: 20,
        color: darkColor,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/BabyDetails');
          },
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${AppLocalizations.of(context)!.minutesFromBirth("22")}",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: new TextSpan(
                                  // Note: Styles for TextSpans must be explicitly defined.
                                  // Child text spans will inherit styles from parent
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: AppLocalizations.of(context)!.babyOf("Oni"),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: new TextSpan(
                                  // Note: Styles for TextSpans must be explicitly defined.
                                  // Child text spans will inherit styles from parent
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: "${AppLocalizations.of(context)!.location}: ",
                                        style: new TextStyle()),
                                    new TextSpan(
                                        text: ward,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 24,
                                  ),
                                  Text(gender,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color: Theme.of(context).iconTheme.color,
                                size: 30,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
