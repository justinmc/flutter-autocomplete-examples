import 'package:flutter/material.dart';

// Show a dialog pointing out what was selected.
void showSelectedDialog(BuildContext context, String selection) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Selected!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You selected "$selection"'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
