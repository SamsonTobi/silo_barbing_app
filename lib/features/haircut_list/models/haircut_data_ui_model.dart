class Haircut {
  String name;
  String? description;
  DateTime lastUpdated;
  String? photoUrl;
  double? currentPrice;
  String? extraInfos;

  Haircut({
    required this.name,
    required this.description,
    required this.lastUpdated,
    required this.photoUrl,
    required this.currentPrice,
    required this.extraInfos,
  });

  factory Haircut.fromJson(Map<String, dynamic> json) {
    return Haircut(
      name: json['name'],
      description: json['description'],
      lastUpdated: DateTime.parse(json['last_updated']),
      photoUrl: (json['photos'] as List).isNotEmpty ? json['photos'][0]['url'] : '',
      currentPrice: (json['current_price'] as List).isNotEmpty 
        ? (json['current_price'][0]['NGN'] as List).isNotEmpty 
          ? json['current_price'][0]['NGN'][0] 
          : null 
        : null,
      extraInfos: json['extra_infos'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'last_updated': lastUpdated.toIso8601String(),
      'photo_url': photoUrl,
      'current_price': currentPrice,
      'extra_infos': extraInfos,
    };
  }
}

class HaircutDataUiModel {
  List<Haircut> items;

  HaircutDataUiModel({required this.items});

  factory HaircutDataUiModel.fromJson(Map<String, dynamic> json) {
    return HaircutDataUiModel(
      items: (json['items'] as List).map((item) => Haircut.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}