import 'package:rxdart/subjects.dart';

import '../model/launch_model.dart';
import '../model/mission_model.dart';
import '../model/rocket_model.dart';
import '../service/launch_service.dart';
import '../model/launchpads_model.dart';
import '../model/info_model.dart';

class LaunchBloc {
  final _launch = BehaviorSubject<Launch>();
  final _launchService = LaunchService();
  final _listRocket = BehaviorSubject<List<Rocket>>();
  final _listMission = BehaviorSubject<List<Mission>>();
  final _listLaunchpads = BehaviorSubject<List<Launchpad>>();
  final _infoCompany = BehaviorSubject<Info>();

  LaunchBloc() {
    loadLaunch();
    getRocket();
    getMission();
    getLaunchpad();
    getInfo();
  }

  //Getters
  Stream<Launch> get launch => _launch.stream;
  Stream<List<Rocket>> get listRocket => _listRocket.stream;
  Stream<List<Mission>> get listMission => _listMission.stream;
  Stream<List<Launchpad>> get listLaunchpad => _listLaunchpads.stream;
  Stream<Info> get infoCompany => _infoCompany.stream;

  //Setters
  Function(Launch) get changeLaunch => _launch.sink.add;
  Function(List<Rocket>) get changeListRocket => _listRocket.sink.add;
  Function(List<Mission>) get changeListMission => _listMission.sink.add;
  Function(List<Launchpad>) get changeListLaunchpad => _listLaunchpads.sink.add;
  Function(Info) get changeInfo => _infoCompany.sink.add;

  //Dispose
  dispose() {
    _launch.close();
    _listRocket.close();
    _listMission.close();
    _listLaunchpads.close();
    _infoCompany.close();
  }

  Future<void> getInfo() async {
    changeInfo(await _launchService.getInfoCompany());
  }

  Future<void> getLaunchpad() async {
    changeListLaunchpad(await _launchService.getLaunchpadList());
  }

  Future<void> getMission() async {
    changeListMission(await _launchService.getMissionsList());
  }

  Future<void> getRocket() async {
    changeListRocket(await _launchService.getRocketsList());
  }

  Future<void> nLaunch(int n) async {
    changeLaunch(await _launchService.getLaunch(n));
  }

  Future<void> loadLaunch() async {
    changeLaunch(await _launchService.getLaunch(0));
  }
}
