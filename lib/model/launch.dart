import 'package:logintest/model/rocket.dart';

class Launch {
  final DateTime launchTime;
  final Rocket rocket;

  Launch({this.launchTime, this.rocket});

  Launch.fromJson(Map<dynamic, dynamic> parsedJson)
      : launchTime = DateTime.parse(parsedJson['launch_date_utc']),
        rocket = Rocket.fromJson(parsedJson['rocket']);
}
