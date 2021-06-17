import 'package:flutter/material.dart'; 

class SwtichYesNo extends StatefulWidget {
  final String first, second;
  final List<bool> isSelected;
  
  SwtichYesNo(
      this.first, this.second, this.isSelected);

  @override
  _SwtichYesNoState createState() => _SwtichYesNoState();
}

class _SwtichYesNoState extends State<SwtichYesNo> {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = widget.isSelected;
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
                      primary: isSelected[0] ? Colors.blue : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      isSelected[1] = false;
                      isSelected[0] = true;
                    });
                  },
                  child: Text(
                    widget.first,
                    style: TextStyle(
                      color: isSelected[0]
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
                      primary: isSelected[1] ? Colors.blue : null,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  onPressed: () {
                    setState(() {
                      isSelected[0] = false;
                      isSelected[1] = true;
                    });
                  },
                  child: Text(
                    widget.second,
                    style: TextStyle(
                      color: isSelected[1]
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
