import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newborn_care/main.dart';

class ExceptionMessages {
  static Map<String, String> exceptionMessagesMap = ({
    "noInternetConnection":
        AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
            .noInternetConnection,
    "invalidRequest":
        AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
            .invalidRequest,
    "unauthorised":
        AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
            .unauthorised,
    "invalidInput":
        AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
            .invalidInput,
    "errorOccuredWhileCommunication":
        AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
            .errorDuringCommunication,
    "errorDuringCommunication":
        AppLocalizations.of(scaffoldMessengerGlobalKey.currentContext!)!
            .errorDuringCommunication
  });
}
