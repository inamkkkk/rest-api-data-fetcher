class Country {
  final Name name;
  final List<String>? capital;

  Country({required this.name, this.capital});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: Name.fromJson(json['name']), // Parse the 'name' field
      capital: (json['capital'] as List<dynamic>?)?.cast<String>(), // Parse the optional 'capital' field
    );
  }
}

class Name {
  final String common;

  Name({required this.common});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'],
    );
  }
}