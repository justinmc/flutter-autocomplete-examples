import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        child: AutocompleteBasicExample(),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  AutocompleteBasicExample({Key key}) : super(key: key);

  final List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return AutocompleteCore<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        showSelectedDialog(context, selection);
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
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
