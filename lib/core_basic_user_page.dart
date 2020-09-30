import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class AutocompleteCoreBasicUserPage extends StatelessWidget {
  AutocompleteCoreBasicUserPage({Key key, this.title}) : super(key: key);

  final List<User> _kUserOptions = <User>[
    User(name: 'Alice', email: 'alice@example.com'),
    User(name: 'Bob', email: 'bob@example.com'),
    User(name: 'Charlie', email: 'charlie123@gmail.com'),
  ];

  final String title;
  /*
  final AutocompleteController<User> _autocompleteController = AutocompleteController<User>(
    options: <User>[
      User(name: 'Alice', email: 'alice@example.com'),
      User(name: 'Bob', email: 'bob@example.com'),
      User(name: 'Charlie', email: 'charlie123@gmail.com'),
    ],
    // This shows just the name in the field, even though we can also filter by
    // email address.
    displayStringForOption: (User option) => option.name,
  );
  */

  static String _displayStringForOption(User option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCore<User>(
          buildOptions: (TextEditingValue textEditingValue) {
            return _kUserOptions.where((User option) {
              return option.toString().contains(textEditingValue.text.toLowerCase());
            }).toList();
          },
          displayStringForOption: _displayStringForOption,
          onSelected: (User selection) {
            print('justin onselected $selection');
            showSelectedDialog(context, _displayStringForOption(selection));
          },
          buildField: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
            return TextFormField(
              controller: textEditingController,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
            );
          },
          buildResults: (BuildContext context, AutocompleteOnSelected<User> onSelected, List<User> results) {
            return SizedBox(
              height: 200.0,
              child: Material(
                elevation: 4.0,
                child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: results.map((User result) => GestureDetector(
                    onTap: () {
                      onSelected(result);
                    },
                    child: ListTile(
                      title: Text(_displayStringForOption(result)),
                    ),
                  )).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
