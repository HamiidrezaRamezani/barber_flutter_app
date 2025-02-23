class ServiceModel {
  final String slug;
  final String title;
  final String? icon;

  ServiceModel({required this.slug, required this.title, this.icon});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      slug: json['slug'],
      title: json['title'],
      icon: json['icon'],
    );
  }
}