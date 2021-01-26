import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class AutocompleteBasicPage extends StatelessWidget {
  AutocompleteBasicPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Align(
        alignment: Alignment(0.0, -0.5),
        child: AutocompleteBasicExample(),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  AutocompleteBasicExample({Key key}) : super(key: key);

  /*
  final List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];
  */

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == null || textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        showSelectedDialog(context, selection);
      },
    );
  }
}

