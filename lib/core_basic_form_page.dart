import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

class AutocompleteCoreBasicFormPage extends StatefulWidget {
  AutocompleteCoreBasicFormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AutocompleteFormExample createState() => AutocompleteFormExample();
}

class AutocompleteFormExample extends State<AutocompleteCoreBasicFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  String _dropdownValue;
  String _autocompleteSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _dropdownValue,
                icon: Icon(Icons.arrow_downward),
                hint: const Text('This is a regular DropdownButtonFormField'),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (String value) {
                  if (value == null) {
                    return 'Must make a selection.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'This is a regular TextFormField',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Can\'t be empty.';
                  }
                  return null;
                },
              ),
              AutocompleteCore<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return kOptions.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  setState(() {
                    _autocompleteSelection = selection;
                  });
                },
                fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'This is an AutocompleteCore!',
                    ),
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                    },
                    validator: (String value) {
                      if (!kOptions.contains(value)) {
                        return 'Nothing selected.';
                      }
                      return null;
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  final RenderBox renderBox = context.findRenderObject() as RenderBox;
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        child: ListView(
                          padding: EdgeInsets.all(8.0),
                          children: options.map((String option) => GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option),
                            ),
                          )).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Successfully submitted'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('DropdownButtonFormField: "$_dropdownValue"'),
                              Text('TextFormField: "${_textEditingController.text}"'),
                              Text('AutocompleteCore: "$_autocompleteSelection"'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
