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
        child: AutocompleteCore<String>(
          options: kOptions,
          onSelected: (String selection) {
            showSelectedDialog(context, selection);
          },
          buildField: (BuildContext context, TextEditingController textEditingController, AutocompleteOnSelectedString onSelectedString) {
            return TextFormField(
              controller: textEditingController,
              onFieldSubmitted: onSelectedString,
            );
          },
          buildResults: (BuildContext context, AutocompleteOnSelected<String> onSelected, List<String> results) {
            return Material(
              elevation: 4.0,
              child: SizedBox(
                height: 200.0,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
