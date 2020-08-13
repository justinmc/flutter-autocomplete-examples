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
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: kOptions,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCore<String>(
          autocompleteController: _autocompleteController,
          onSelected: (String selection) {
            _showSelectedDialog(context, selection);
          },
          buildField: (BuildContext context) {
            return TextFormField(
              controller: _autocompleteController.textEditingController,
            );
          },
          buildResults: (BuildContext context, OnSelectedAutocomplete<String> onSelected, List<String> results) {
            return ListView(
              children: results.map((String result) => GestureDetector(
                onTap: () {
                  onSelected(result);
                },
                child: ListTile(
                  title: Text(result),
                ),
              )).toList(),
            );
          },
        ),
      ),
    );
  }
}
