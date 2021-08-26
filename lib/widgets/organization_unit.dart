import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrganizationUnit extends StatelessWidget {
  final textController;
  const OrganizationUnit({Key? key, required this.textController}) : super(key: key);

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
          hintText: "yvWZnR3olFA",
          labelText: AppLocalizations.of(context)!.orgUnitID,
        ),
      ),
    );
  }
}
