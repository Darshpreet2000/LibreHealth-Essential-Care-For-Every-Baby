import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/main.dart';

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException(message)
      : super(message,
            "${AppLocalizations.of(drawerKey!.currentContext!)!.errorDuringCommunication}: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "${AppLocalizations.of(drawerKey!.currentContext!)!.invalidRequest}: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(message) : super(message, "${AppLocalizations.of(drawerKey!.currentContext!)!.unauthorised}: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException(message) : super(message, "${AppLocalizations.of(drawerKey!.currentContext!)!.invalidInput}: ");
}
