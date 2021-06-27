import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListItemRiskMonitoringAlert extends StatefulWidget {
  final String? parent, checkup;
  final Color? color;
  final bool? value;
  final bool? inDanger;

  const ListItemRiskMonitoringAlert(
      {Key? key,
      this.parent,
      this.checkup,
      this.color,
      this.value,
      this.inDanger})
      : super(key: key);

  @override
  _ListItemMonitoringAlert createState() => _ListItemMonitoringAlert(value);
}

class _ListItemMonitoringAlert extends State<ListItemRiskMonitoringAlert> {
  bool? checkedValue;

  _ListItemMonitoringAlert(this.checkedValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      height: 25,
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        AppLocalizations.of(context)!.babyOf(widget.parent!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "${AppLocalizations.of(context)!.location}: Prenatal Ward",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text("EAT 11:06 AM"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.checkup!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Checkbox(
                      value: checkedValue,
                      onChanged: (value) {
                        setState(() {
                          checkedValue = !checkedValue!;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
