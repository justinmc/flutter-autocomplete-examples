import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class Backend {
  static Future<List<User>>getUsers([String query]) {
    return Future<List<User>>.delayed(const Duration(seconds: 2), () {
      final List<String> queryResults = query == null
          ? kOptions
          : kOptions.where((String name) => name.contains(query)).toList();
      return queryResults.map((String name) => User(name: name)).toList();
    });
  }
}


class AsyncPage extends StatelessWidget {
  AsyncPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<User> _autocompleteController = AutocompleteController<User>(
    // TODO(justinmc): This demo is lacking a loading state most obviously. Also
    // debouncing.
    displayStringForOption: (User option) => option.name,
    // TODO(justinmc): Can use this async filter when AutocompleteCore is using
    // FutureOr<List<T>>.
    /*
    filter: (String query) async {
      return await Backend.getUsers(query);
    },
    */
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
          onSelected: (User selection) {
            showSelectedDialog(context, _autocompleteController.displayStringForOption(selection));
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
            return Material(
              elevation: 4.0,
              child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (BuildContext context, int index) {
                    final User result = results[index];
                    return GestureDetector(
                      onTap: () {
                        onSelected(result);
                      },
                      child: ListTile(
                        title: Text(_autocompleteController.displayStringForOption(result)),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
