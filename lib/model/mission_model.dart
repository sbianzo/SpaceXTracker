class Mission {
  final String missionName;
  final String missionID;
  final wiki;

  Mission({this.missionID, this.missionName, this.wiki});

  Mission.fromJson(Map<String, dynamic> parsedJson)
      : missionName = parsedJson['mission_name'],
        missionID = parsedJson['mission_id'],
        wiki = parsedJson['wikipedia'];
}
