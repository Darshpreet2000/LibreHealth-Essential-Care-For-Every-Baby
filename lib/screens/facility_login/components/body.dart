import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newborn_care/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:newborn_care/widgets/long_app_bar.dart';
import 'package:newborn_care/widgets/password.dart';
import 'package:newborn_care/widgets/short_app_bar_login.dart';
import 'package:newborn_care/widgets/sign_in_button.dart';
import 'package:newborn_care/widgets/user_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userNameTextController = new TextEditingController();
  var passwordTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
        if (state is AuthenticationLoaded) {
          Navigator.pushReplacementNamed(context, '/Base');
        }
        if (state is AuthenticationError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      }, child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
        return SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              orientation == Orientation.portrait ||
                      (MediaQuery.of(context).size.height > 600)
                  ? LongAppBar()
                  : ShortAppBarLogin(
                      title: AppLocalizations.of(context)!.individual,
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state is AuthenticationLoading
                          ? CircularProgressIndicator()
                          : Container(),
                      UserName(
                        textController: userNameTextController,
                      ),
                      Password(
                        textController: passwordTextController,
                      ),
                      SignIn(
                        userNameTextController: userNameTextController,
                        passwordTextController: passwordTextController,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      }));
    });
  }
}
