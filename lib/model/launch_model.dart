import '../model/rocket_model.dart';

class Launch {
  final DateTime launchTime;
  final Rocket rocket;

  Launch({this.launchTime, this.rocket});

  Launch.fromJson(Map<String, dynamic> parsedJson)
      : launchTime = DateTime.parse(parsedJson['launch_date_utc']),
        rocket = Rocket.fromJson(parsedJson['rocket']);
}
