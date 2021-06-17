import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final textController;
  const UserName(
      {Key? key, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: textController,
    
        decoration: new InputDecoration(  
          prefixIcon: Icon(Icons.person),
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.grey[300]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(305.0),
            ),
          ),
          hintText: 'Local Login Address',
          labelText: 'Username',
        ),
      ),
    );
  }
}
