import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class RawAutocompleteSubmitFailPage extends StatelessWidget {
  RawAutocompleteSubmitFailPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteSubmitFailExample(
          title: title,
        ),
      ),
    );
  }
}

class AutocompleteSubmitFailExample extends StatelessWidget {
  AutocompleteSubmitFailExample({Key key, this.title}) : super(key: key);

  final String title;

  void _showFailDialog(BuildContext context, String value) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fail!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You tried to submit "$value", but that doesn\'t match anything!'),
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

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        showSelectedDialog(context, selection);
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: "Try submitting the field with a value that doesn't match any of the options.",
          ),
          controller: textEditingController,
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
            // Here is where the field value is validated, and if it's not a
            // valid selection, a dialog is shown.
            if (!kOptions.contains(textEditingController.text)) {
              _showFailDialog(context, value);
            }
          },
        );
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
