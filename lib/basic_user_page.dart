import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class AutocompleteBasicUserPage extends StatelessWidget {
  AutocompleteBasicUserPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Align(
        alignment: Alignment(0.0, -0.5),
        child: AutocompleteBasicUserExample(),
      ),
    );
  }
}

class AutocompleteBasicUserExample extends StatelessWidget {
  AutocompleteBasicUserExample({Key key}) : super(key: key);

  static final List<User> _userOptions = <User>[
    User(name: 'Alice', email: 'alice@example.com'),
    User(name: 'Bob', email: 'bob@example.com'),
    User(name: 'Charlie', email: 'charlie123@gmail.com'),
  ];

  static String _displayStringForOption(User option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<User>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == null || textEditingValue.text == '') {
          return const Iterable<User>.empty();
        }
        return _userOptions.where((User option) {
          return option.toString().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (User selection) {
        showSelectedDialog(context, _displayStringForOption(selection));
      },
    );
  }
}


