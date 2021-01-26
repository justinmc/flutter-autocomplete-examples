import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'selected_dialog.dart';

class AutocompleteBasicNarrowPage extends StatelessWidget {
  AutocompleteBasicNarrowPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteBasicNarrowExample(),
      ),
    );
  }
}

class AutocompleteBasicNarrowExample extends StatelessWidget {
  AutocompleteBasicNarrowExample({Key key}) : super(key: key);

  final List<String> _options = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return _options.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          showSelectedDialog(context, selection);
        },
        ),
    );
  }
}


