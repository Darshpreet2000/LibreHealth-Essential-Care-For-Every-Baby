import 'package:flutter/material.dart';

class ShortAppBar extends StatelessWidget {
  final color = const Color(0xff82A0C8);
  final title;
  final bool showDrawerID;
  const ShortAppBar({Key key, @required this.title, this.showDrawerID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Row(
              children: [
                showDrawerID == true
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 28,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                            text: title, style: TextStyle(fontSize: 22)),
                        showDrawerID == true
                            ? new TextSpan(
                                text: "\n" + "ID: ****123",
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))
                            : new TextSpan(text: ""),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 16, 0),
            child: Center(
              child: Image.asset(
                "assets/mhbs.png",
                width: 100,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          boxShadow: [new BoxShadow(blurRadius: 4.0)],
          color: color,
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(40.0),
              bottomRight: const Radius.circular(40.0))
      ),
    );
  }
}
