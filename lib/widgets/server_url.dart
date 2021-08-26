import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServerUrl extends StatelessWidget {
  final textController;
  const ServerUrl({Key? key, required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        decoration: new InputDecoration(
          prefixIcon: Icon(Icons.link),
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.grey[300]!),
            borderRadius: const BorderRadius.all(
              const Radius.circular(305.0),
            ),
          ),
          hintText: "https://play.dhis2.org",
          labelText: AppLocalizations.of(context)!.serverUrl,
        ),
      ),
    );
  }
}
