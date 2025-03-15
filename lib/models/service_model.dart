class ServiceModel {
  final String nameAr;
  final String nameEn;
  final String img;
  final List<String> featuresAr;
  final List<String> featuresEn;

  ServiceModel({
    required this.nameAr,
    required this.nameEn,
    required this.featuresAr,
    required this.featuresEn,
    required this.img,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      featuresAr: List<String>.from(json['features_ar'] ?? []),
      featuresEn: List<String>.from(json['features_en'] ?? []),
      img: json['img'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_ar': nameAr,
      'name_en': nameEn,
      'features_ar': featuresAr,
      'features_en': featuresEn,
      'img' : img
    };
  }
}
