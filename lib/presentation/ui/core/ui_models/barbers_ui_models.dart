class BarbersUiModels {
  String name;
  List<String> services;
  String address;
  String slug;
  String avatar;
  double distance;
  int rate;
  bool isShop;

  BarbersUiModels({
    required this.name,
    required this.slug,
    required this.address,
    required this.services,
    required this.avatar,
    required this.distance,
    required this.isShop,
    required this.rate,
  });
}
