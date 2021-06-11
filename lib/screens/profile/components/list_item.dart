import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16.0, top: 8, bottom: 8),
            child: Container(
              color: Colors.grey[400],
              height: 1.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8, bottom: 8),
            child: Text(
              "Baby of 1 Oni has been registered at post natal ward at " +
                  "7:20 AM",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "09/02/2021",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "7:20 AM",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
