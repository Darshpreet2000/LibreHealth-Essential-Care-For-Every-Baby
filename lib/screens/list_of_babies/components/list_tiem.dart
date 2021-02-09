import 'package:flutter/material.dart';

Widget listItem(
    String parent, String ward, String gender, Color color, Color darkColor) {
  return Container(
    margin: EdgeInsets.only(top: 12),
    color: darkColor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
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
                child: Text("22 Minutes From Birth",
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
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: "Baby ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                new TextSpan(
                                    text: "of ",
                                    style: new TextStyle(fontSize: 16)),
                                new TextSpan(
                                    text: parent,
                                    style: TextStyle(
                                        color: Colors.black,
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
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: "Location: ", style: new TextStyle()),
                                new TextSpan(
                                    text: ward,
                                    style: TextStyle(
                                        color: Colors.black,
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
                                color: Colors.black,
                                size: 24,
                              ),
                              Text(gender,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.chevron_right_sharp,
                            color: Colors.black,
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
  );
}
