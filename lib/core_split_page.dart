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
  VoidCallback _onFieldSubmitted;

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
            _onFieldSubmitted();
          },
        ),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: RawAutocomplete<String>(
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
          fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
            // This is probably the weirdest part of this
            // approach. In order to tell RawAutocomplete that the field has
            // been submitted, I need to save this callback here, since the
            // field is actually being built elsewhere.
            _onFieldSubmitted = onFieldSubmitted;
            // I build an empty field here, because the real field is built
            // elsewhere.
            return SizedBox.shrink();
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
