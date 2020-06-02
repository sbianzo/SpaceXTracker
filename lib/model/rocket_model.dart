class Rocket {
  final String rocketName;
  final String firstFlight;
  final String description;

  Rocket({this.rocketName, this.description, this.firstFlight});

  Rocket.fromJson(Map<String, dynamic> parsedJson)
      : rocketName = parsedJson['rocket_name'],
        description = parsedJson['description'],
        firstFlight = parsedJson['first_flight'];
}
