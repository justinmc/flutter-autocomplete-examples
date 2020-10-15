import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
// import 'selected_dialog.dart';

// TODO(justinmc): This example won't work until we support non-floating
// options.
class AutocompleteCoreSplitPage extends StatelessWidget {
  AutocompleteCoreSplitPage({Key key, this.title}) : super(key: key);

  final String title;

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
          optionsBuilder: (TextEditingValue textEditingValue) {
            return kOptions.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            }).toList();
          },
          fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
            return SizedBox.shrink();
          },
          optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, List<String> options) {
            return Material(
              elevation: 4.0,
              child: SizedBox(
                height: 200.0,
                child: ListView(
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
            );
          },
        ),
      ),
    );
  }
}
