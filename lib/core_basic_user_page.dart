import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class AutocompleteCoreBasicUserPage extends StatelessWidget {
  AutocompleteCoreBasicUserPage({Key key, this.title}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCustomTypeExample(),
      ),
    );
  }
}

class AutocompleteCustomTypeExample extends StatelessWidget {
  AutocompleteCustomTypeExample({Key key});

  static final List<User> _userOptions = <User>[
    User(name: 'Alice', email: 'alice@example.com'),
    User(name: 'Bob', email: 'bob@example.com'),
    User(name: 'Charlie', email: 'charlie123@gmail.com'),
  ];

  static String _displayStringForOption(User option) => option.name;

  @override
  Widget build(BuildContext context) {
    return AutocompleteCore<User>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _userOptions.where((User option) {
          return option.toString().contains(textEditingValue.text.toLowerCase());
        });
      },
      displayStringForOption: _displayStringForOption,
      onSelected: (User selection) {
        showSelectedDialog(context, _displayStringForOption(selection));
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<User> onSelected, Iterable<User> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: 200.0,
            child: Material(
              elevation: 4.0,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: options.map((User option) => GestureDetector(
                  onTap: () {
                    onSelected(option);
                  },
                  child: ListTile(
                    title: Text(_displayStringForOption(option)),
                  ),
                )).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
