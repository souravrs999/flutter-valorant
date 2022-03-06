class Maps {
  Maps({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  Maps.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.uuid,
    required this.displayName,
    required this.coordinates,
    this.displayIcon,
    required this.listViewIcon,
    required this.splash,
    required this.assetPath,
    required this.mapUrl,
    required this.xMultiplier,
    required this.yMultiplier,
    required this.xScalarToAdd,
    required this.yScalarToAdd,
    this.callouts,
  });
  late final String uuid;
  late final String displayName;
  late final String coordinates;
  late final String? displayIcon;
  late final String listViewIcon;
  late final String splash;
  late final String assetPath;
  late final String mapUrl;
  late final num? xMultiplier;
  late final num? yMultiplier;
  late final num? xScalarToAdd;
  late final num? yScalarToAdd;
  late final List<Callouts>? callouts;

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    coordinates = json['coordinates'];
    displayIcon = null;
    listViewIcon = json['listViewIcon'];
    splash = json['splash'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    xMultiplier = json['xMultiplier'];
    yMultiplier = json['yMultiplier'];
    xScalarToAdd = json['xScalarToAdd'];
    yScalarToAdd = json['yScalarToAdd'];
    callouts = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['coordinates'] = coordinates;
    _data['displayIcon'] = displayIcon;
    _data['listViewIcon'] = listViewIcon;
    _data['splash'] = splash;
    _data['assetPath'] = assetPath;
    _data['mapUrl'] = mapUrl;
    _data['xMultiplier'] = xMultiplier;
    _data['yMultiplier'] = yMultiplier;
    _data['xScalarToAdd'] = xScalarToAdd;
    _data['yScalarToAdd'] = yScalarToAdd;
    _data['callouts'] = callouts;
    return _data;
  }
}

class Callouts {
  Callouts({
    required this.regionName,
    required this.superRegionName,
    required this.location,
  });
  late final String regionName;
  late final String superRegionName;
  late final Location location;

  Callouts.fromJson(Map<String, dynamic> json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
    location = Location.fromJson(json['location']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['regionName'] = regionName;
    _data['superRegionName'] = superRegionName;
    _data['location'] = location.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.x,
    required this.y,
  });
  late final double? x;
  late final double? y;

  Location.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['x'] = x;
    _data['y'] = y;
    return _data;
  }
}
