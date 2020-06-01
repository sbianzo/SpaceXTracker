import 'package:logintest/model/launch_model.dart';
import 'package:logintest/model/rocket_model.dart';
import 'package:logintest/service/launch_service.dart';
import 'package:rxdart/subjects.dart';

class LaunchBloc {
  final _launch = BehaviorSubject<Launch>();
  final _launchService = LaunchService();
  final _rockets = BehaviorSubject<Rocket>();
  final _listRocket = BehaviorSubject<List<RocketA>>();

  LaunchBloc() {
    loadLaunch();
    getRocket();
  }

  //Getters
  Stream<Launch> get launch => _launch.stream;
  Stream<Rocket> get rocket => _rockets.stream;
  Stream<List<RocketA>> get listRocket => _listRocket.stream;

  //Setters
  Function(Launch) get changeLaunch => _launch.sink.add;
  Function(Rocket) get changeRocket => _rockets.sink.add;
  Function(List<RocketA>) get changeListRocket => _listRocket.sink.add;

  //Dispose
  dispose() {
    _launch.close();
    _rockets.close();
    _listRocket.close();
  }

  Future<void> getRocket() async {
    // changeRocket(await _launchService.getRockets());
    changeListRocket(await _launchService.getRocketsList());
  }

  Future<void> nLaunch(int n) async {
    changeLaunch(await _launchService.getLaunch(n));
  }

  Future<void> loadLaunch() async {
    changeLaunch(await _launchService.getLaunch(0));
  }
}
