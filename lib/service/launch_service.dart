import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:logintest/model/launch_model.dart';
import 'package:logintest/model/rocket_model.dart';

class LaunchService {
  Future<Launch> getLaunch(int n) async {
    var response =
        await http.get('https://api.spacexdata.com/v3/launches/upcoming');

    var json = convert.jsonDecode(response.body);

    var launch = Launch.fromJson(json[n]);

    return launch;
  }

  Future<Rocket> getRockets() async {
    var response = await http.get('https://api.spacexdata.com/v3/rockets');

    var json = convert.jsonDecode(response.body);

    var rockets = Rocket.fromJson(json);

    return rockets;
  }

  Future<List<RocketA>> getRocketsList() async {
    var response = await http.get('https://api.spacexdata.com/v3/rockets');

    List<RocketA> rockets = (convert.jsonDecode(response.body) as List)
        .map((data) => RocketA.fromJson(data))
        .toList();

    return rockets;
  }
}
