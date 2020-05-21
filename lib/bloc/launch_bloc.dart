import 'package:logintest/model/launch.dart';
import 'package:rxdart/subjects.dart';

import '../launch_service.dart';

class LaunchBloc {
  final _launch = BehaviorSubject<Launch>();
  final _launchService = LaunchService();

  LaunchBloc() {
    loadLaunch();
  }

  //Getters
  Stream<Launch> get launch => _launch.stream;

  //Setters
  Function(Launch) get changeLaunch => _launch.sink.add;

  //Dispose
  dispose() {
    _launch.close();
  }

  Future<void> nLaunch(int n) async {
    changeLaunch(await _launchService.getLaunch(n));
  }

  Future<void> loadLaunch() async {
    changeLaunch(await _launchService.getLaunch(0));
  }
}
