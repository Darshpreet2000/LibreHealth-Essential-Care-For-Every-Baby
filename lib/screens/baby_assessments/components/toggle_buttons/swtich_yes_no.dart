import 'package:flutter/material.dart';

class SwtichYesNo extends StatefulWidget {
  final String first, second;
  final List<bool?> isSelected;
  final int index;

  SwtichYesNo(this.first, this.second, this.isSelected,this.index);

  @override
  _SwtichYesNoState createState() => _SwtichYesNoState();
}

class _SwtichYesNoState extends State<SwtichYesNo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.blue, width: 2.5),
                      primary:
                          widget.isSelected[widget.index] != null && widget.isSelected[widget.index]  == true
                              ? Colors.blue
                              : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget.isSelected[widget.index]  = true;
                    });
                  },
                  child: Text(
                    widget.first,
                    style: TextStyle(
                      color:
                          widget.isSelected[widget.index]  != null && widget.isSelected[widget.index] == true
                              ? Colors.white
                              : Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.blue, width: 2.5),
                      primary:
                          widget.isSelected[widget.index]  != null && widget.isSelected[widget.index] == true
                              ? Colors.blue
                              : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      widget.isSelected[widget.index]  = false;
                    });
                  },
                  child: Text(
                    widget.second,
                    style: TextStyle(
                      color:
                          widget.isSelected[widget.index]  != null && widget.isSelected[widget.index]  == true
                              ? Colors.white
                              : Theme.of(context).textTheme.subtitle1!.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
