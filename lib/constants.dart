const List<String> kOptions = <String>[
  'aardvark',
  'bobcat',
  'chameleon',
  'dingo',
  'elephant',
  'flamingo',
  'goose',
  'hippo',
  'hippopotamus',
  'iguana',
  'jaguar',
  'koala',
  'lemur',
  'mouse',
  'northern white rhinocerous',
];

// An example of a type that someone might want to autocomplete a list of.
class User {
  const User({
    this.email,
    this.name,
  });

  final String email;
  final String name;

  // When using a default filter function, the query will be matched
  // directly with the output of this toString method. In this case,
  // including both the email and name allows the user to filter by both.
  // If you wanted even more advanced filter logic, you could pass a custom
  // filter function into AutocompleteController and/or filterStringForOption
  // into AutocompleteCore.
  @override
  String toString() {
    return '$name, $email';
  }
}
