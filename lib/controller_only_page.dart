import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class ControllerOnlyPage extends StatelessWidget {
  ControllerOnlyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: _ControllerOnlyExample(),
      ),
    );
  }
}

class _ControllerOnlyExample extends StatefulWidget {
  _ControllerOnlyExample({Key key}) : super(key: key);

  @override
  _ControllerOnlyExampleState createState() => _ControllerOnlyExampleState();
}

class _ControllerOnlyExampleState extends State<_ControllerOnlyExample> {
  final AutocompleteController autocompleteController = AutocompleteController(
    buildOptions: AutocompleteController.generateDefaultBuildOptions(kOptions),
  );

  void _onChangedOptions() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    autocompleteController.options.addListener(_onChangedOptions);
  }

  @override
  void dispose() {
    autocompleteController.options.removeListener(_onChangedOptions);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Field.
        TextFormField(
          controller: autocompleteController.textEditingController,
          onFieldSubmitted: (String value) {
            // Select the first option if there is one, otherwise do nothing.
            final List<String> options = autocompleteController.buildOptions(
              autocompleteController.textEditingController.value,
            );
            if (options.isEmpty) {
              return;
            }
            autocompleteController.selection.value = options[0];
            showSelectedDialog(context, autocompleteController.selection.value);
          },
        ),
        // Results.
        if (autocompleteController.options.value.length > 0
            && autocompleteController.selection.value == null)
          Material(
            elevation: 4.0,
            child: Container(
              height: 200.0,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: autocompleteController.options.value.length,
                itemBuilder: (BuildContext context, int index) {
                  final String result = autocompleteController.options.value[index];
                  return GestureDetector(
                    onTap: () {
                      autocompleteController.selection.value = result;
                      showSelectedDialog(context, autocompleteController.selection.value);
                    },
                    child: ListTile(
                      title: Text(result),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
