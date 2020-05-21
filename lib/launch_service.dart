import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:logintest/model/launch.dart';

class LaunchService {
  Future<Launch> getLaunch(int n) async {
    var response =
        await http.get('https://api.spacexdata.com/v3/launches/upcoming');

    var json = convert.jsonDecode(response.body);

    var launch = Launch.fromJson(json[n]);

    return launch;
  }
}
