import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Password extends StatefulWidget {
  final textController;

  const Password({Key? key, required this.textController}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.textController,
        obscureText: !this._showPassword,
        decoration: new InputDecoration(
          prefixIcon: Icon(Icons.security),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: this._showPassword ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() => this._showPassword = !this._showPassword);
            },
          ),
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.grey[300]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(305.0),
            ),
          ),
          hintText: AppLocalizations.of(context)!.password,
          labelText: AppLocalizations.of(context)!.password,
        ),
      ),
    );
  }
}
