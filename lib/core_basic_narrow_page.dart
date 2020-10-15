import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'selected_dialog.dart';

class AutocompleteCoreBasicNarrowPage extends StatelessWidget {
  AutocompleteCoreBasicNarrowPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCoreBasicNarrowExample(),
      ),
    );
  }
}

class AutocompleteCoreBasicNarrowExample extends StatelessWidget {
  AutocompleteCoreBasicNarrowExample({Key key}) : super(key: key);

  final List<String> _options = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  final double _fieldWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return AutocompleteCore<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _options.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        showSelectedDialog(context, selection);
      },
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
        return Container(
          width: _fieldWidth,
          child: TextFormField(
            controller: textEditingController,
            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
          ),
        );
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
              height: 200.0,
              width: _fieldWidth,
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

