import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignIn extends StatelessWidget {
  final userNameTextController;
  final passwordTextController;
  final serverTextController;
  final orgTextController;
  const SignIn(
      {Key? key,
      required this.serverTextController,
      required this.userNameTextController,
      required this.passwordTextController,
       required this.orgTextController})
      : super(key: key);

  bool calculateWhetherDisabledReturnsBool() {
    if (serverTextController.text.toString().isEmpty ||
        userNameTextController.text.toString().isEmpty ||
        passwordTextController.text.toString().isEmpty||
        orgTextController.text.toString().isEmpty
        ) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: ElevatedButton(
        child: new Text(
          AppLocalizations.of(context)!.signin,
          style: TextStyle(
              fontSize: 16,
              color: calculateWhetherDisabledReturnsBool()
                  ? Colors.blue[200]
                  : Colors.blue),
        ),
        onPressed: calculateWhetherDisabledReturnsBool()
            ? null
            : () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                    AuthenticationLoginEvent(
                        userNameTextController.text,
                        passwordTextController.text,
                        serverTextController.text,
                        orgTextController.text
                        ));
              },
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: new RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
                borderRadius: new BorderRadius.circular(30.0))),
      ),
    );
  }
}
