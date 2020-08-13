import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

const List<String> _options = <String>[
  'aardvark',
  'baboon',
  'chameleon',
  'dingo',
  'elephant',
  'flamingo',
  'goose',
  'hippopotamus',
  'iguana',
  'jaguar',
  'koala',
  'lemur',
  'mouse',
  'northern white rhinocerous',
];

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
        '/core-basic': (BuildContext context) => AutocompleteCoreBasicPage(title: 'AutocompleteCore Basic'),
        '/core-basic-user': (BuildContext context) => AutocompleteCoreBasicUserPage(title: 'AutocompleteCore Basic with a custom T type'),
        '/core-basic-form': (BuildContext context) => AutocompleteCoreBasicFormPage(title: 'AutocompleteCore in a Form'),
        '/core-split': (BuildContext context) => AutocompleteCoreSplitPage(title: 'AutocompleteCore Split'),
        '/custom-ui': (BuildContext context) => CustomUIPage(title: 'AutocompleteController Only'),
        /*
        '/vanilla': (BuildContext context) => VanillaPage(title: 'Simplest Example'),
        '/async': (BuildContext context) => AsyncPage(title: 'Simple Async'),
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
                title: const Text('AutocompleteCore Basic'),
                subtitle: const Text('Two custom builders as minimal as possible.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-basic-user');
              },
              child: ListTile(
                title: const Text('AutocompleteCore Basic User'),
                subtitle: const Text('Minimal but with a custom T type.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-basic-form');
              },
              child: ListTile(
                title: const Text('AutocompleteCore Basic Form'),
                subtitle: const Text('AutocompleteCore in a Form.'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/core-split');
              },
              child: ListTile(
                title: const Text('AutocompleteCore Split'),
                subtitle: const Text('Render the results and field somewhere completely different.'),
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
                Navigator.of(context).pushNamed('/async');
              },
              child: ListTile(
                title: const Text('Simple Async'),
                subtitle: const Text('Items are queried asynchronously.'),
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
                Navigator.of(context).pushNamed('/custom-ui');
              },
              child: ListTile(
                title: const Text('Fully Custom UI'),
                subtitle: const Text('Completely custom UI that only uses AutocompleteController.'),
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
          ],
        ),
      ),
    );
  }
}

class User {
  const User({
    this.email,
    this.name,
  });

  final String email;
  final String name;

  @override
  String toString() {
    return '$name, $email';
  }
}

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
      options: <String>[],//_options,
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
                    _autocompleteController.textEditingController.text = result;
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

void _showSelectedDialog(BuildContext context, String selection) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Selected!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('You selected "$selection"'),
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
}

// TODO(justinmc): Try integrating into a form.
// TODO(justinmc): Try Removing the need to pass a controller.
class AutocompleteCoreBasicPage extends StatelessWidget {
  AutocompleteCoreBasicPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: _options,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCore<String>(
          autocompleteController: _autocompleteController,
          onSelected: (String selection) {
            _showSelectedDialog(context, selection);
          },
          buildField: (BuildContext context) {
            return TextFormField(
              controller: _autocompleteController.textEditingController,
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
    );
  }
}

class AutocompleteCoreBasicUserPage extends StatelessWidget {
  AutocompleteCoreBasicUserPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<User> _autocompleteController = AutocompleteController<User>(
    options: <User>[
      User(name: 'Alice', email: 'alice@example.com'),
      User(name: 'Bob', email: 'bob@example.com'),
      User(name: 'Charlie', email: 'charlie123@gmail.com'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AutocompleteCore<User>(
          autocompleteController: _autocompleteController,
          onSelected: (User selected) {
            _autocompleteController.textEditingController.value = TextEditingValue(
              selection: TextSelection.collapsed(offset: selected.name.length),
              text: selected.name,
            );
          },
          buildField: (BuildContext context) {
            return TextFormField(
              controller: _autocompleteController.textEditingController,
            );
          },
          buildResults: (BuildContext context, OnSelectedAutocomplete<User> onSelected, List<User> results) {
            return ListView(
              children: results.map((User result) => GestureDetector(
                onTap: () {
                  onSelected(result);
                },
                child: ListTile(
                  title: Text(result.name),
                ),
              )).toList(),
            );
          },
        ),
      ),
    );
  }
}

class AutocompleteCoreBasicFormPage extends StatefulWidget {
  AutocompleteCoreBasicFormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AutocompleteCoreBasicFormPageState createState() => AutocompleteCoreBasicFormPageState();
}

class AutocompleteCoreBasicFormPageState extends State<AutocompleteCoreBasicFormPage> {
  final _formKey = GlobalKey<FormState>();
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: _options,
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
                    _autocompleteController.textEditingController.text = selection;
                    setState(() {
                      _autocompleteSelection = selection;
                    });
                  },
                  buildField: (BuildContext context) {
                    return TextFormField(
                      controller: _autocompleteController.textEditingController,
                      validator: (String value) {
                        if (!_options.contains(value)) {
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

class AutocompleteCoreSplitPage extends StatelessWidget {
  AutocompleteCoreSplitPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    options: _options,
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
          buildField: (BuildContext context) {
            return SizedBox.shrink();
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
  Widget buildResults(BuildContext context) {
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
    if (_options.isEmpty()) {
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
      itemCount: _options.length,
      itemBuilder: (context, index) {
        var result = _options[index];
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

class Backend {
  static Future<List<Item>>getItems([String query]) {
    return Future<List<Item>>.delayed(const Duration(seconds: 2), () {
      final List<String> queryResults = query == null
          ? _options
          : _options.where((String name) => name.contains(query)).toList();
      return queryResults.map((String name) => Item(name: name)).toList();
    });
  }
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
    options: _options,
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
          items: _options,
        ),
        */
        child: AutocompleteDividedMaterial<String>(
          autocompleteController: _autocompleteController,
        ),
      ),
    );
  }
}

class AsyncPage extends StatelessWidget {
  AsyncPage({Key key, this.title}) : super(key: key);

  final String title;
  final AutocompleteController<String> _autocompleteController = AutocompleteController<String>(
    // TODO(justinmc): This demo is lacking a loading state most obviously. Also
    // debouncing.
    search: (String query) async {
      final List<Item> items = await Backend.getItems(query);
      return items.map((Item item) => item.name).toList();
    },
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
          debounceDuration: const Duration(seconds: 2),
          onSearch: (String query) async {
            final List<Item> items = await Backend.getItems(query);
            return items.map((Item item) => item.name).toList();
          },
        ),
        */
        child: AutocompleteDividedMaterial<String>(
          autocompleteController: _autocompleteController
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
    options: _options,
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
          buildField: (BuildContext context) {
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
          options: _options,
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
      options: _options,
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
            options: _options,
          ),
        ),
        */
        child: AutocompleteDividedMaterial<String>(
          autocompleteController: _autocompleteController,
          buildField: (BuildContext context) {
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
          buildResults: (BuildContext context, List<String> results, onSelected) {
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
    options: _options,
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
    options: _options,
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
