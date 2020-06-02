class Launchpad {
  final String name;
  final String status;
  final LocationLaunchpad locationLaunchpad;
  final String details;

  Launchpad({this.name, this.status, this.locationLaunchpad, this.details});

  Launchpad.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        status = parsedJson['status'],
        locationLaunchpad = LocationLaunchpad.fromJson(parsedJson['location']),
        details = parsedJson['details'];
}

class LocationLaunchpad {
  final String name;
  final String region;
  final double latitude;
  final double longitude;

  LocationLaunchpad({this.name, this.latitude, this.longitude, this.region});

  LocationLaunchpad.fromJson(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        region = parsedJson['region'],
        latitude = parsedJson['latitude'],
        longitude = parsedJson['longitude'];
}
