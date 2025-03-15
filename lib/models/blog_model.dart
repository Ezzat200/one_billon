import 'package:cloud_firestore/cloud_firestore.dart'; // مهمة علشان Timestamp
import 'package:intl/intl.dart';

class BlogModel {
  final String detailsAr;
  final String detailsEn;
  final String img;
  final String titleAr;
  final String titleEn;
  final String date; // هيبقى String بعد التنسيق

  BlogModel({
    required this.detailsAr,
    required this.detailsEn,
    required this.img,
    required this.titleAr,
    required this.titleEn,
    required this.date,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    String formattedDate = '';
    if (json['date'] != null) {
      try {
        // لو التاريخ جاي كـ Timestamp من Firebase
        if (json['date'] is Timestamp) {
          DateTime dateTime = (json['date'] as Timestamp).toDate();
          formattedDate = DateFormat('d MMMM y', 'en').format(dateTime); // أو 'ar'
        } 
        // لو جاي كـ String
        else if (json['date'] is String) {
          DateTime parsed = DateTime.parse(json['date']);
          formattedDate = DateFormat('d MMMM y', 'en').format(parsed);
        }
      } catch (e) {
        formattedDate = json['date'].toString();
      }
    }

    return BlogModel(
      detailsAr: json['details_ar'] ?? '',
      detailsEn: json['details_en'] ?? '',
      img: json['img'] ?? '',
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      date: formattedDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details_ar': detailsAr,
      'details_en': detailsEn,
      'img': img,
      'title_ar': titleAr,
      'title_en': titleEn,
      'date': date,
    };
  }
}
