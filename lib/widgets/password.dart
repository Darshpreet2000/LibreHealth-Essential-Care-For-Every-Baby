import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final textController;

  final Function notifyParent;

  const Password(
      {Key? key, required this.textController, required this.notifyParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: textController,
        obscureText: true,
        readOnly: true,
        onTap: () {
          notifyParent();
        },
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.grey[300]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(305.0),
            ),
          ),
          hintText: 'Password',
          labelText: 'Password',
        ),
      ),
    );
  }
}
