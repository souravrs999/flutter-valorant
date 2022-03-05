class Events {
  Events({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  Events.fromJson(Map<String, dynamic> json) {
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
    required this.shortDisplayName,
    required this.startTime,
    required this.endTime,
    required this.assetPath,
  });
  late final String uuid;
  late final String displayName;
  late final String shortDisplayName;
  late final String startTime;
  late final String endTime;
  late final String assetPath;

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    shortDisplayName = json['shortDisplayName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['shortDisplayName'] = shortDisplayName;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['assetPath'] = assetPath;
    return _data;
  }
}
