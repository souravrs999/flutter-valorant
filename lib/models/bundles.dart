class Bundles {
  Bundles({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  Bundles.fromJson(Map<String, dynamic> json) {
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
    this.displayNameSubText,
    required this.description,
    this.extraDescription,
    this.promoDescription,
    required this.useAdditionalContext,
    required this.displayIcon,
    required this.displayIcon2,
    this.verticalPromoImage,
    required this.assetPath,
  });
  late final String uuid;
  late final String displayName;
  late final String? displayNameSubText;
  late final String description;
  late final String? extraDescription;
  late final String? promoDescription;
  late final bool useAdditionalContext;
  late final String displayIcon;
  late final String displayIcon2;
  late final String? verticalPromoImage;
  late final String assetPath;

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayNameSubText = null;
    description = json['description'];
    extraDescription = null;
    promoDescription = null;
    useAdditionalContext = json['useAdditionalContext'];
    displayIcon = json['displayIcon'];
    displayIcon2 = json['displayIcon2'];
    verticalPromoImage = json['verticalPromoImage'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['displayNameSubText'] = displayNameSubText;
    _data['description'] = description;
    _data['extraDescription'] = extraDescription;
    _data['promoDescription'] = promoDescription;
    _data['useAdditionalContext'] = useAdditionalContext;
    _data['displayIcon'] = displayIcon;
    _data['displayIcon2'] = displayIcon2;
    _data['verticalPromoImage'] = verticalPromoImage;
    _data['assetPath'] = assetPath;
    return _data;
  }
}
