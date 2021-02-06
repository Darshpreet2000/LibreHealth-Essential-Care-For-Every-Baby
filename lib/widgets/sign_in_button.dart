import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  bool calculateWhetherDisabledReturnsBool(){
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,


      child: OutlineButton(
          child: new Text("Sign In",style: TextStyle(fontSize: 16,color: calculateWhetherDisabledReturnsBool() ? Colors.blue[200] :Colors.blue),),
          onPressed:  calculateWhetherDisabledReturnsBool() ? null : () => {},borderSide: BorderSide(color: Colors.grey),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
      ),
    );
  }
}
