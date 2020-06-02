class Info {
  final String name;
  final String founder;
  final int yearFounded;
  final int employees;
  final String summary;
  final Headquarter headquarter;
  final Links links;

  Info(
      {this.employees,
      this.founder,
      this.headquarter,
      this.links,
      this.name,
      this.summary,
      this.yearFounded});

  Info.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        founder = parsedJson['founder'],
        employees = parsedJson['employees'],
        summary = parsedJson['summary'],
        headquarter = Headquarter.fromJson(parsedJson['headquarters']),
        links = Links.fromJson(parsedJson['links']),
        yearFounded = parsedJson['founded'];
}

class Headquarter {
  final String address;
  final String city;
  final String state;

  Headquarter({this.address, this.city, this.state});

  Headquarter.fromJson(Map<String, dynamic> parsedJson)
      : address = parsedJson['address'],
        city = parsedJson['city'],
        state = parsedJson['state'];
}

class Links {
  final String website;
  final String twitter;
  final String elonTwitter;

  Links({this.elonTwitter, this.twitter, this.website});

  Links.fromJson(Map<String, dynamic> parsedJson)
      : website = parsedJson['website'],
        twitter = parsedJson['twitter'],
        elonTwitter = parsedJson['elon_twitter'];
}
