import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
// import 'selected_dialog.dart';

// TODO(justinmc): This example won't work until we support non-floating
// results.
class AutocompleteCoreSplitPage extends StatelessWidget {
  AutocompleteCoreSplitPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: kOptions,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: _autocompleteController.textEditingController,
          decoration: InputDecoration(
            hintText: title,
          ),
        ),
      ),
      body: Center(
        child: AutocompleteCore<String>(
          autocompleteController: _autocompleteController,
          buildField: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
            return SizedBox.shrink();
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
