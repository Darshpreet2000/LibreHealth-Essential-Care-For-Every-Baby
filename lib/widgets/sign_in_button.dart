import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final textController;
  final Function notifyParent;

  const SignIn(
      {Key key, @required this.textController, @required this.notifyParent})
      : super(key: key);

  bool calculateWhetherDisabledReturnsBool() {
    if (textController.text.toString().length > 0) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: ElevatedButton(
        child: new Text(
          "Sign In",
          style: TextStyle(
              fontSize: 16,
              color: calculateWhetherDisabledReturnsBool()
                  ? Colors.blue[200]
                  : Colors.blue),
        ),
        onPressed: calculateWhetherDisabledReturnsBool()
            ? null
            : () => {Navigator.pushNamed(context, '/Base')},
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: new RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }
}
