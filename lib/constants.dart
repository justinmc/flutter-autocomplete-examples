import 'dart:ui' show hashValues;

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
  // If you wanted even more advanced filter logic, you could customize
  // resultBuilder.
  @override
  String toString() {
    return '$name, $email';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType)
      return false;
    return other is User
        && other.name == name
        && other.email == email;
  }

  @override
  int get hashCode => hashValues(email, name);
}

final List<User> kUserOptions = <User>[
  User(name: 'Alice', email: 'alice@example.com'),
  User(name: 'Bob', email: 'bob@example.com'),
  User(name: 'Charlie', email: 'charlie123@gmail.com'),
];
