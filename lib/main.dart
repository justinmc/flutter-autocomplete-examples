import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'controller_only_page.dart';
//import 'core_async_page.dart';
import 'core_basic_form_page.dart';
import 'core_basic_page.dart';
import 'core_submit_fail_page.dart';
import 'core_basic_user_page.dart';
import 'core_basic_narrow_page.dart';
//import 'core_split_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/core-basic': (BuildContext context) => RawAutocompleteBasicPage(title: 'RawAutocomplete Basic'),
        '/core-basic-user': (BuildContext context) => RawAutocompleteBasicUserPage(title: 'RawAutocomplete Basic with a custom T type'),
        '/core-basic-form': (BuildContext context) => RawAutocompleteBasicFormPage(title: 'RawAutocomplete in a Form'),
        '/core-basic-narrow': (BuildContext context) => RawAutocompleteBasicNarrowPage(title: 'RawAutocomplete with a narrow field'),
        '/core-submit-fail': (BuildContext context) => RawAutocompleteSubmitFailPage(title: 'RawAutocomplete Submission Fail'),
        //'/core-split': (BuildContext context) => RawAutocompleteSplitPage(title: 'RawAutocomplete Split'),
        //'/custom-ui': (BuildContext context) => ControllerOnlyPage(title: 'AutocompleteController Only'),
        //'/async': (BuildContext context) => AsyncPage(title: 'Simple Async'),
        /*
        '/vanilla': (BuildContext context) => VanillaPage(title: 'Simplest Example'),
        '/custom-input': (BuildContext context) => CustomInputPage(title: 'Custom Input'),
        '/fully-customizable': (BuildContext context) => FullyCustomizablePage(title: 'Custon Input and Results'),
        //'/basic-own-controller': (BuildContext context) => BasicOwnControllerPage(title: 'BasicOwnController'),
        '/floating-results': (BuildContext context) => FloatingResultsPage(title: 'Floating Results'),
        '/cupertino': (BuildContext context) => CupertinoPage(title: 'Cupertino Field'),
        */
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            /*
            GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              child: ListTile(
                title: const Text('SearchDelegate Example'),
              ),
            ),
            */
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-basic');
              },
              child: ListTile(
                title: const Text('RawAutocomplete Basic'),
                subtitle: const Text('Two custom builders as minimal as possible.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-basic-user');
              },
              child: ListTile(
                title: const Text('RawAutocomplete Basic User'),
                subtitle: const Text('Minimal but with a custom T type.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-basic-form');
              },
              child: ListTile(
                title: const Text('RawAutocomplete Basic Form'),
                subtitle: const Text('RawAutocomplete in a Form.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-basic-narrow');
              },
              child: ListTile(
                title: const Text('RawAutocomplete Basic Narrow'),
                subtitle: const Text('RawAutocomplete with a narrow field and options that match its width.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-submit-fail');
              },
              child: ListTile(
                title: const Text('AutocompleteBasic Submission Fail'),
                subtitle: const Text('Do something custom when the field is submitted with no valid result available.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                //Navigator.of(context).pushNamed('/custom-ui');
              },
              child: ListTile(
                title: const Text('DISABLED AutocompleteController-only Custom UI'),
                subtitle: const Text('Completely custom UI that only uses AutocompleteController, not RawAutocomplete. Needs autocomplete-controller branch update.'),
              ),
            ),
            /*
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/async');
              },
              child: ListTile(
                title: const Text('Simple Async'),
                subtitle: const Text('Items are queried asynchronously.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/vanilla');
              },
              child: ListTile(
                title: const Text('Simplest Example'),
                subtitle: const Text('Just pass a list of strings, widget handles everything by default.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/custom-input');
              },
              child: ListTile(
                title: const Text('Custom Input'),
                subtitle: const Text('This example doesn\t use Autocomplete\'s TextFormField, but does use its default results.'),
              ),
            ),
            /*
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/basic-own-controller');
              },
              child: ListTile(
                title: const Text('BasicOwnController'),
                subtitle: const Text('Autocomplete widget that owns its controller and only takes options.'),
              ),
            ),
            */
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/fully-customizable');
              },
              child: ListTile(
                title: const Text('Fully Customizable'),
                subtitle: const Text('Uses the fully customizable version of the widget.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/floating-results');
              },
              child: ListTile(
                title: const Text('Floating Results'),
                subtitle: const Text('Results float on top of content below the field.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/cupertino');
              },
              child: ListTile(
                title: const Text('Cupertino'),
                subtitle: const Text('Uses a CupertinoTextField.'),
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}

/*
class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget resultsBuilder(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    /*
    if (loading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
        ],
      );
    }
    */

    /*
    if (kOptions.isEmpty()) {
      return Column(
        children: <Widget>[
          Text(
            "No Results Found.",
          ),
        ],
      );
    }
    */

    return ListView.builder(
      itemCount: kOptions.length,
      itemBuilder: (context, index) {
        var result = kOptions[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text('suggestion1'),
        ),
        ListTile(
          title: const Text('suggestion2'),
        ),
      ],
    );
  }
}

class Item {
  Item({
    this.name = 'Unnamed',
  });

  final String name;
  final double price = 1.99;
}

// TODO(justinmc): A real debounce class should maybe operate on a per-callback
// basis.
class Debounce {
  Debounce({
    VoidCallback callback,
    Duration duration,
  }) : assert(callback != null),
       assert(duration != null) {
    if (timer != null) {
      timer.cancel();
    }
    timer = Timer(duration, () {
      timer.cancel();
      callback();
    });
  }

  static Timer timer;

  static void dispose() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }
}

class VanillaPage extends StatelessWidget {
  VanillaPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: kOptions,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        /*
        child: Autocomplete<String>(
          items: kOptions,
        ),
        */
        child: AutocompleteDividedMaterial<String>(
          autocompleteController: _autocompleteController,
        ),
      ),
    );
  }
}

class CustomInputPage extends StatelessWidget {
  CustomInputPage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: kOptions,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteDividedMaterial<String>(
          autocompleteController: _autocompleteController,
          fieldBuilder: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
            return TextField(
              controller: _autocompleteController.textEditingController,
              decoration: InputDecoration(
                hintText: 'My custom input',
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
class BasicOwnControllerPage extends StatelessWidget {
  BasicOwnControllerPage({
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
        child: AutocompleteBasicOwnController<String>(
          options: kOptions,
        ),
      ),
    );
  }
}
*/

class FullyCustomizablePage extends StatefulWidget {
  FullyCustomizablePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  FullyCustomizablePageState createState() => FullyCustomizablePageState();
}

class FullyCustomizablePageState extends State<FullyCustomizablePage> {
  final TextEditingController _textEditingController = TextEditingController();
  AutocompleteController<String> _autocompleteController;

  String _selection;

  @override
  void initState() {
    super.initState();
    _autocompleteController = AutocompleteController<String>(
      textEditingController: _textEditingController,
      options: kOptions,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        /*
        child: AutocompleteFullyCustomizable<String>(
          autocompleteController: AutocompleteController(
            options: kOptions,
          ),
        ),
        */
        child: AutocompleteDividedMaterial<String>(
          autocompleteController: _autocompleteController,
          fieldBuilder: (BuildContext context, TextEditingController textEditingController, VoidCallback onFieldSubmitted) {
            return TextFormField(
              controller: _autocompleteController.textEditingController,
              decoration: InputDecoration(
                hintText: 'Custom hint text!',
              ),
              onChanged: (String value) {
                if (value != _selection) {
                  setState(() {
                    _selection = null;
                  });
                }
              },
            );
          },
          resultsBuilder: (BuildContext context, List<String> results, onSelected) {
            if (_selection != null) {
              return const Text('emptiness!');
            }
            return ListView(
              children: _autocompleteController.results.value.map((String result) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selection = result;
                    _autocompleteController.textEditingController.text = result;
                  });
                },
                child: ListTile(
                  title: Text(result),
                ),
              )).toList(),
            );
          },
        ),
      ),
    );
  }
}

class FloatingResultsPage extends StatelessWidget {
  FloatingResultsPage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: kOptions,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteDividedMaterial<String>.floatingResults(
          autocompleteController: _autocompleteController,
        ),
      ),
    );
  }
}

class CupertinoPage extends StatelessWidget {
  CupertinoPage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: kOptions,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        /*
        child: AutocompleteFullyCustomizable<String>.cupertino(
          autocompleteController: _autocompleteController,
        ),
        */
        child: AutocompleteDividedCupertino<String>.floatingResults(
          autocompleteController: _autocompleteController,
        ),
      ),
    );
  }
}
*/

/*
class CustomItems extends StatefulWidget {
  CustomItems({Key key}) : super(key: key);

  @override
  CustomItemsState createState() => CustomItemsState();
}
class CustomItemsState extends State<CustomItems>{ @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typeahead Example'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Autocomplete<Item>(
              getItems: (String query) {
                return Backend.getItems();
              },
            ),
            Expanded(
              child: ListView(
                children: _items.map((T item) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _items = <T>[];
                      // TODO(justinmc): Builder.
                      _controller.text = item.toString();
                    });
                  },
                  child: ListTile(
                    title: Text(item.toString()),
                    subtitle: Text('\$${item.toString()}'),
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

// TODO(justinmc): Should be FutureOr for synchronous support.
typedef Future<List<T>> ItemsGetter<T>(String query);
/*
import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(home: new MyApp())
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  final FocusNode emailFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () => focusEmail(),
        child: new Icon(Icons.remove_red_eye),
      ),
      body: Center(
        child: Form(
          child: TextFormField(
            focusNode: emailFocusNode,
            decoration: new InputDecoration(
              labelText: "Email",
              hintText: 'you@swol.com',
            ),
            onFieldSubmitted: (value) => focusEmail(),
          ),
        ),
      ),
    );
  }

  focusEmail() async{
    print("node focused? " + emailFocusNode.toString());
    if(emailFocusNode.hasFocus)
      print("it HAS focus");
    else
      print("it DOES NOT have focus");
    print("focsuing node" + emailFocusNode.toString());
    FocusScope.of(context).requestFocus(emailFocusNode);
    while(emailFocusNode.hasFocus == false) await Future.delayed(new Duration(milliseconds: 100));
    print("node is definatley focused " + emailFocusNode.toString());
  }
}
*/
