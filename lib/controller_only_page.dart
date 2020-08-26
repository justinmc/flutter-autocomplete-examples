import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
//import 'selected_dialog.dart';

class CustomUIPage extends StatelessWidget {
  CustomUIPage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: CustomUIAutocomplete(),
      ),
    );
  }
}

class CustomUIAutocomplete extends StatefulWidget {
  CustomUIAutocomplete({Key key}) : super(key: key);

  @override
  CustomUIAutocompleteState createState() => CustomUIAutocompleteState();
}

class CustomUIAutocompleteState extends State<CustomUIAutocomplete> {
  AutocompleteController<String> _autocompleteController;
  String _selection;

  void _onChangeResults() {
    setState(() {});
  }

  void _onChangeQuery() {
    if (_autocompleteController.textEditingController.value.text != _selection) {
      setState(() {
        _selection = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _autocompleteController = AutocompleteController<String>(
      options: kOptions,
    );
    _autocompleteController.textEditingController.addListener(_onChangeQuery);
    _autocompleteController.results.addListener(_onChangeResults);
  }

  @override
  void dispose() {
    _autocompleteController.textEditingController.removeListener(_onChangeQuery);
    _autocompleteController.results.removeListener(_onChangeResults);
    _autocompleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Query field.
        TextFormField(
          controller: _autocompleteController.textEditingController,
        ),
        // Results list.
        if (_selection == null)
          Expanded(
            child: ListView(
              children: _autocompleteController.results.value.map((String result) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selection = result;
                    _autocompleteController.textEditingController.value = TextEditingValue(
                      selection: TextSelection.collapsed(offset: result.length),
                      text: result,
                    );
                  });
                },
                child: ListTile(
                  title: Text(result),
                ),
              )).toList(),
            ),
          ),
      ],
    );
  }
}
