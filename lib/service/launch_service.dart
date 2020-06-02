import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/launch_model.dart';
import '../model/mission_model.dart';
import '../model/rocket_model.dart';

class LaunchService {
  Future<Launch> getLaunch(int n) async {
    var response =
        await http.get('https://api.spacexdata.com/v3/launches/upcoming');

    var json = convert.jsonDecode(response.body);

    var launch = Launch.fromJson(json[n]);

    return launch;
  }

  Future<List<Rocket>> getRocketsList() async {
    var response = await http.get('https://api.spacexdata.com/v3/rockets');

    List<Rocket> rockets = (convert.jsonDecode(response.body) as List)
        .map((data) => Rocket.fromJson(data))
        .toList();

    return rockets;
  }

  Future<List<Mission>> getMissionsList() async {
    var response = await http.get('https://api.spacexdata.com/v3/missions');

    List<Mission> missions = (convert.jsonDecode(response.body) as List)
        .map((data) => Mission.fromJson(data))
        .toList();

    return missions;
  }
}
