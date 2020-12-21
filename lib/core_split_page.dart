import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'selected_dialog.dart';

class RawAutocompleteSplitPage extends StatefulWidget {
  RawAutocompleteSplitPage({Key key, this.title}) : super(key: key);

  final String title;

  RawAutocompleteSplitPageState createState() => RawAutocompleteSplitPageState();
}

class RawAutocompleteSplitPageState extends State<RawAutocompleteSplitPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  GlobalKey _autocompleteKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This is where the real field is being built.
        title: TextFormField(
          controller: _textEditingController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.title,
          ),
          onFieldSubmitted: (String value) {
            RawAutocomplete.onFieldSubmitted(_autocompleteKey);
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: RawAutocomplete<String>(
          key: _autocompleteKey,
          // The split approach is achieved by allowing RawAutocomplete to
          // accept focusNode and textEditingController as parameters.
          focusNode: _focusNode,
          textEditingController: _textEditingController,
          onSelected: (String selection) {
            showSelectedDialog(context, selection);
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            return kOptions.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            }).toList();
          },
          // TODO(justinmc): This example should use non-floating results once we support
          // that.
          optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
            return Material(
              elevation: 4.0,
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
            );
          },
        ),
      ),
    );
  }
}
