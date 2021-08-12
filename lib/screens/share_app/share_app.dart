import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void shareApp(BuildContext context) {
  Share.share(AppLocalizations.of(context)!.shareMessage + "\n  APP_LINK ");
}
