class BarberModel {
  final String slug;
  final String fullname;
  final bool isShop;
  final String avatar;
  final String address;
  final double lat;
  final double lon;
  final int rate;
  final double distance;
  final bool isBookmarked;
  final String phoneNumber;
  final int reviewsCount;
  final List<String> services;

  BarberModel({
    required this.slug,
    required this.fullname,
    required this.isShop,
    required this.avatar,
    required this.address,
    required this.lat,
    required this.lon,
    required this.rate,
    required this.distance,
    required this.isBookmarked,
    required this.phoneNumber,
    required this.reviewsCount,
    required this.services,
  });

  factory BarberModel.fromJson(Map<String, dynamic> json) {
    return BarberModel(
      slug: json['slug'],
      fullname: json['fullname'],
      isShop: json['is_shop'],
      avatar: json['avatar'],
      address: json['address'],
      lat: (json['lat'] ?? 0.0).toDouble(),  // اطمینان از double بودن مقدار
      lon: (json['lon'] ?? 0.0).toDouble(),  // اطمینان از double بودن مقدار
      rate: (json['rate'] ?? 0).toInt(),  // تبدیل مقدار به int
      distance: (json['distance'] ?? 0.0).toDouble(),  // تبدیل مقدار به double
      isBookmarked: json['is_bookmarked'] ?? false,
      phoneNumber: json['phone_number'] ?? '',
      reviewsCount: (json['reviews_count'] ?? 0).toInt(),  // تبدیل مقدار به int
      services: List<String>.from(json['services'] ?? []), // لیست خالی در صورت نبود مقدار
    );
  }
}


class BarberResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<BarberModel> results;

  BarberResponse( {required this.count, required this.results, required this.next,required this.previous,});

  factory BarberResponse.fromJson(Map<String, dynamic> json) {
    return BarberResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((e) => BarberModel.fromJson(e))
          .toList(),
    );
  }
}
