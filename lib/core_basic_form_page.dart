import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';

class AutocompleteCoreBasicFormPage extends StatefulWidget {
  AutocompleteCoreBasicFormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AutocompleteCoreBasicFormPageState createState() => AutocompleteCoreBasicFormPageState();
}

class AutocompleteCoreBasicFormPageState extends State<AutocompleteCoreBasicFormPage> {
  final _formKey = GlobalKey<FormState>();
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: kOptions,
  );
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
              Container(
                height: 200,
                child: AutocompleteCore<String>(
                  autocompleteController: _autocompleteController,
                  onSelected: (String selection) {
                    setState(() {
                      _autocompleteSelection = selection;
                    });
                  },
                  buildField: (BuildContext context) {
                    return TextFormField(
                      controller: _autocompleteController.textEditingController,
                      validator: (String value) {
                        if (!kOptions.contains(value)) {
                          return 'Nothing selected.';
                        }
                        return null;
                      },
                    );
                  },
                  buildResults: (BuildContext context, OnSelectedAutocomplete<String> onSelected, List<String> results) {
                    return ListView(
                      children: results.map((String result) => GestureDetector(
                        onTap: () {
                          onSelected(result);
                        },
                        child: ListTile(
                          title: Text(result),
                        ),
                      )).toList(),
                    );
                  },
                ),
              ),
              RaisedButton(
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


