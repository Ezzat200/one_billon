class BlogModel {
  final String detailsAr;
  final String detailsEn;
  final String img;
  final String titleAr;
  final String titleEn;

  BlogModel({
    required this.detailsAr,
    required this.detailsEn,
    required this.img,
    required this.titleAr,
    required this.titleEn,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      detailsAr: json['details_ar'] ?? '',
      detailsEn: json['details_en'] ?? '',
      img: json['img'] ?? '',
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details_ar': detailsAr,
      'details_en': detailsEn,
      'img': img,
      'title_ar': titleAr,
      'title_en': titleEn,
    };
  }
}
