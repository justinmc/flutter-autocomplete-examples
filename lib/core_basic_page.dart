import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

void _showSelectedDialog(BuildContext context, String selection) {
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

class AutocompleteCoreBasicPage extends StatelessWidget {
  AutocompleteCoreBasicPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCore<String>(
          options: kOptions,
          onSelected: (String selection) {
            _showSelectedDialog(context, selection);
          },
          buildField: (BuildContext context, TextEditingController textEditingController) {
            return TextFormField(
              controller: textEditingController,
            );
          },
          buildResults: (BuildContext context, OnSelectedAutocomplete<String> onSelected, List<String> results) {
            return Material(
              elevation: 4.0,
              child: ListView(
                children: results.map((String result) => GestureDetector(
                  onTap: () {
                    onSelected(result);
                  },
                  child: ListTile(
                    title: Text(result),
                  ),
                )).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
