import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget switchYesNo(
    bool? isSelected, Function onChange, BuildContext context, bool readOnly) {
  return FormField<bool?>(
    initialValue: isSelected,
    builder: (FormFieldState<bool?> state) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 2.5),
                        primary: isSelected != null && isSelected == true
                            ? Colors.blue
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                    onPressed: () {
                      if (readOnly == false) {
                        onChange(true);
                        state.didChange(true);
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.yes,
                      style: TextStyle(
                        color: isSelected != null && isSelected == true
                            ? Colors.white
                            : Theme.of(context).textTheme.subtitle1!.color,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 2.5),
                        primary: isSelected != null && isSelected == false
                            ? Colors.blue
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                    onPressed: () {
                      if (readOnly == false) {
                        onChange(false);
                        state.didChange(false);
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.no,
                      style: TextStyle(
                        color: isSelected != null && isSelected == false
                            ? Colors.white
                            : Theme.of(context).textTheme.subtitle1!.color,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          state.errorText == null
              ? Container()
              : Text(state.errorText!, style: TextStyle(color: Colors.red)),
        ],
      );
    },
    validator: (val) {
      if (val == null) return AppLocalizations.of(context)!.completeAssessments;
    },
  );
}
