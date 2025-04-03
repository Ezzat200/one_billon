class ServiceSectionModel {
  final String name;
  final String nameAr;

  ServiceSectionModel( {required this.name,required this.nameAr });

  factory ServiceSectionModel.fromJson(Map<String, dynamic> json) {
    return ServiceSectionModel(
      name: json['name'] ?? '',
      nameAr: json['name_ar'] ?? '',
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'name_ar': nameAr,
    };
  }
}
