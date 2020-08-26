import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

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
        child: AutocompleteBasicExample(
          title: title,
        ),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  AutocompleteBasicExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AutocompleteCore<String>(
      options: kOptions,
      onSelected: (String selection) {
        showSelectedDialog(context, selection);
      },
      buildField: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      buildResults: (BuildContext context, AutocompleteOnSelected<String> onSelected, List<String> results) {
        return Material(
          elevation: 4.0,
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                final String result = results[index];
                return GestureDetector(
                  onTap: () {
                    onSelected(result);
                  },
                  child: ListTile(
                    title: Text(result),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
