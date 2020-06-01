class Rocket {
  final String rocketName;

  Rocket({this.rocketName});

  Rocket.fromJson(Map<dynamic, dynamic> parsedJson)
      : rocketName = parsedJson['rocket_name'];
}

class RocketA {
  final String rocketName;
  final String wikiRocket;
  final String description;
  final String rocketType;

  RocketA(
      {this.rocketName, this.description, this.rocketType, this.wikiRocket});

  RocketA.fromJson(Map<dynamic, dynamic> parsedJson)
      : rocketName = parsedJson['rocket_name'],
        wikiRocket = parsedJson['wikpedia'],
        description = parsedJson['description'],
        rocketType = parsedJson['rocket_type'];
}
