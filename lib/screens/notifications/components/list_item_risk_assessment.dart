import 'package:flutter/material.dart';

class ListItemRiskAssessment extends StatefulWidget {
  final String parent;
  final Color color;
  final bool value;
  final bool inDanger;

  const ListItemRiskAssessment(
      {Key key, this.parent, this.color, this.value, this.inDanger})
      : super(key: key);

  @override
  _ListItemRiskAssessmentState createState() =>
      _ListItemRiskAssessmentState(value);
}

class _ListItemRiskAssessmentState extends State<ListItemRiskAssessment> {
  bool checkedValue;

  _ListItemRiskAssessmentState(this.checkedValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      height: 25,
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "Baby of " + widget.parent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "Location: Prenatal Ward",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text("EAT 11:06 AM"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text("Status changed",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: 'Problem to ',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            widget.inDanger
                                ? new TextSpan(
                                    text: 'Danger',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))
                                : new TextSpan(
                                    text: 'Normal',
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Checkbox(
                      value: checkedValue,
                      onChanged: (value) {
                        setState(() {
                          checkedValue = value;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
