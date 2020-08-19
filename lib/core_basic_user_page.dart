import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// An example of a type that someone might want to autocomplete a list of.
class User {
  const User({
    this.email,
    this.name,
  });

  final String email;
  final String name;

  @override
  String toString() {
    return '$name, $email';
  }
}

class AutocompleteCoreBasicUserPage extends StatelessWidget {
  AutocompleteCoreBasicUserPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<User> _autocompleteController = AutocompleteController<User>(
    options: <User>[
      User(name: 'Alice', email: 'alice@example.com'),
      User(name: 'Bob', email: 'bob@example.com'),
      User(name: 'Charlie', email: 'charlie123@gmail.com'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCore<User>(
          autocompleteController: _autocompleteController,
          onSelected: (User selected) {
            _autocompleteController.textEditingController.value = TextEditingValue(
              selection: TextSelection.collapsed(offset: selected.name.length),
              text: selected.name,
            );
          },
          buildField: (BuildContext context, TextEditingController textEditingController) {
            return TextFormField(
              controller: _autocompleteController.textEditingController,
            );
          },
          buildResults: (BuildContext context, OnSelectedAutocomplete<User> onSelected, List<User> results) {
            return Material(
              elevation: 4.0,
              child: SizedBox(
                height: 200.0,
                child: ListView(
                  children: results.map((User result) => GestureDetector(
                    onTap: () {
                      onSelected(result);
                    },
                    child: ListTile(
                      title: Text(result.name),
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
